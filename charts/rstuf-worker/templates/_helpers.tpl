{{/*
Expand the name of the chart.
*/}}
{{- define "rstuf-worker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rstuf-worker.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rstuf-worker.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rstuf-worker.labels" -}}
helm.sh/chart: {{ include "rstuf-worker.chart" . }}
{{ include "rstuf-worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rstuf-worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rstuf-worker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rstuf-worker.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rstuf-worker.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
S3 Gateway fullname
*/}}
{{- define "rstuf-worker.s3GatewayFullname" -}}
{{- printf "%s-s3-gateway" (include "rstuf-worker.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
S3 Gateway labels
*/}}
{{- define "rstuf-worker.s3GatewayLabels" -}}
helm.sh/chart: {{ include "rstuf-worker.chart" . }}
{{ include "rstuf-worker.s3GatewaySelectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
S3 Gateway selector labels
*/}}
{{- define "rstuf-worker.s3GatewaySelectorLabels" -}}
app.kubernetes.io/name: s3-gateway
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
S3 Gateway service account name
*/}}
{{- define "rstuf-worker.s3GatewayServiceAccountName" -}}
{{- if .Values.s3Gateway.serviceAccount.create }}
{{- default (include "rstuf-worker.s3GatewayFullname" .) .Values.s3Gateway.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.s3Gateway.serviceAccount.name }}
{{- end }}
{{- end }}
