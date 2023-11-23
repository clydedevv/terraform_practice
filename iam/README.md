## IAM Configuration

The IAM configuration in `iam/main.tf` is designed to ensure secure and restricted access to AWS resources. It includes the following components:

- **IAM Policy (`s3_cloudfront_policy`)**: This policy grants specific, limited permissions to S3 and CloudFront resources. It allows essential actions like 
`GetObject`, `PutObject`, and `DeleteObject` on specific S3 buckets named according to the environment (e.g., `bucket1-dev`, `bucket2-dev`). For CloudFront, 
it permits actions to retrieve and update distributions.

- **IAM Role (`terraform_role`)**: The role is intended for resources (like EC2 instances) that require access to the specified S3 buckets and CloudFront 
distributions. It assumes a trust relationship with the EC2 service.

- **Role Policy Attachment**: This attaches the `s3_cloudfront_policy` to the `terraform_role`, enabling resources assuming this role to have the defined 
permissions.

### Security and Best Practices

- **Principle of Least Privilege**: The policy adheres to the principle of least privilege by granting only the necessary permissions for specific resources 
and actions, reducing the risk of unauthorized access.

- **Environment-Specific Configuration**: Resources and permissions are tailored to each environment (`dev`, `staging`, `prod`), ensuring clear separation and 
control.

- **Role Usage**: The role is configured for use by EC2 instances. If you're using this role in a different context (e.g., a CI/CD pipeline), adjust the trust 
relationship accordingly.

### Tags

Resources are tagged with the environment name for easy identification and management.

