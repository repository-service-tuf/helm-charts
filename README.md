# helm-charts

Repository Service for TUF helm charts

> We are looking for contributors to help improving these helm charts.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Also, check Visit [https://repository-service-tuf.readthedocs.org](https://repository-service-tuf.readthedocs.io/en/stable/)
to get started with RSTUF.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add rstuf https://repository-service-tuf.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
rstuf` to see the charts.

## Charts

You can search all rstuf charts using following command:

```bash
helm search repo rstuf
```


### rstuf-api

Exclusively for the Repository Service for TUF API service.

### rstuf-worker

Exclusively for the Repository Service for TUF Worker service.

### rstuf-demo

This is a helm chart to deploy the Repository Service for TUF demo.
You can use it for quick testing of the Repository Service for TUF.

Do not use this chart for production deployments.

It uses localstack to simulate AWS services and use AWS S3, and KMS
services.
