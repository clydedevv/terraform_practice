# CloudFront Module

This module is responsible for setting up AWS CloudFront distributions for our web application infrastructure. It ensures that static content is served 
efficiently and securely.

## Features

- **Environment Specific**: Configurations are tailored for different deployment environments (development, staging, production).
- **Security**: Integrates with AWS S3 buckets and employs HTTPS for secure content delivery.
- **Flexibility**: Allows for easy configuration changes and updates as per specific environment needs.

## Outputs

- `cloudfront_distribution_domain_names`: The domain names of the CloudFront distributions created for each environment.

## Usage

To use this module, specify the S3 bucket domain names for each environment. The module will create CloudFront distributions accordingly.

## Configuration

The module includes the following key configurations:

- **S3 Bucket Integration**: Each distribution is linked to a specific S3 bucket based on the environment and content path.
- **HTTPS Enforcement**: Configures viewer protocol policies to enforce HTTPS, with stricter policies in production environments.
- **Caching and Performance**: Default cache behaviors are set for optimal performance while allowing necessary flexibility.

Remember to update the configuration if there are changes in the S3 bucket setup or if different cache behaviors are required.

