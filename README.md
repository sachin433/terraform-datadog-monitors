# Terraform Datadog Configuration

This repository contains Terraform configurations for setting up various components in Datadog, including monitors, SLOs, downtimes, custom metric tags, metric metadata, and log indexes. These configurations allow for a streamlined and consistent setup of Datadog resources, tailored to specific needs.

## Modules

### Datadog Monitors

- **Purpose**: Creates Datadog monitors.
- **Module Path**: `../modules/monitor`
- **Variables**:
  - `dd_properties`: Datadog properties.
  - `env`: Environment variable.
  - `datadog_app_key`: Datadog application key.
  - `datadog_api_key`: Datadog API key.

### Datadog SLOs

- **Purpose**: Sets up Datadog Service Level Objectives (SLOs).
- **Module Path**: `../modules/metric-slo`
- **Variables**:
  - `slo_configs`: SLO configuration parameters.
  - `datadog_app_key`: Datadog application key.
  - `datadog_api_key`: Datadog API key.

## Resources

### Datadog Downtimes

- **Purpose**: Configures downtimes in Datadog.
- **Variables**:
  - `dd_downtime`: Downtime configuration parameters.

### Datadog Custom Metric Tags

- **Purpose**: Configures custom metric tags.
- **Variables**:
  - `dd_tags`: Custom metric tag configurations.

### Datadog Metric Metadata

- **Purpose**: Configures metadata for Datadog metrics.
- **Variables**:
  - `dd_metadata`: Metric metadata configurations.

### Datadog Log Indexes

- **Purpose**: Creates log indexes in Datadog.
- **Variables**:
  - `log_indexes`: Log index configurations.

## Usage

To use these modules, ensure you have set the necessary variables in your Terraform configurations. The variables should be defined according to your specific Datadog setup requirements.

1. **Initialize Terraform**: Run `terraform init` to initialize a working directory containing Terraform configuration files.
2. **Plan and Apply**: Run `terraform plan` to preview the changes, and `terraform apply` to apply the changes to your Datadog environment.

## Requirements

- Terraform installed.
- Access to a Datadog account with necessary permissions.
- Relevant API and application keys for Datadog.
