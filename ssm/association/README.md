### Prerequisites

1. The managed EC2 instances exist and are tagged as defined in the variables.tf
2. A instance profile is attched the managed instances with appropriate SSM and S3 access permissions.
3. The required Ansible platbooks spceified in variables.tf are uploaded in S3 and GitHub repository respectively.
4. The records of Github owner, repo, and file path in the repo are stored in SSM Parameter Store.