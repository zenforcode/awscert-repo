# AWS CLI commands cheatsheet

## General
To start using AWS CLI prefix command with `aws`.
To display help:
```bash
aws help
```

To configure user, including the region:
```bash
aws configure
```

## IAM
IAM is a web service that helps you securely control access to AWS resources. With IAM, you can manage permissions that control which AWS resources users can access.
To display IAM information related to current user:
```bash
aws iam get-user
```
To display user's IAM plicies:
```bash
aws iam list-attached-user-policies --user-name <USER_NAME>
```
To display user's IAM policies as as table:
```bash
aws iam list-attached-user-policies --user-name <USER_NAME> --output table
```
To display aviable ARN policies:
```bash
aws iam list-policies 
```
To display policies as text or table:
```bash
aws iam list-policies --query 'Policies[*].[PolicyName, Arn]' (--output text | table)
```
To attach a new plicy to a user:
```bash
aws iam attach-user-policy --user-name <USER_NAME> --policy-arn <POLICY_ARN>
```
Where `<POLICY_ARN>` looks like: `arn:aws:iam::<ARN_NUMBER>:policy/<POLICY_NAME>`
To detach a policy from a user:
```bash
aws iam detach-user-policy --user-name <USER_NAME> --policy-arn <POLICY_ARN>
```
To create a new policy based on file:
```bash
aws iam create-policy --policy-name <POLICY_NAME> --policy-document file://<PATH_TO_FILE>
```
To create a new version of a policy based on a file:
```bash
aws iam create-policy-version --policy-arn <IAM_POLICY> --policy-document file://<PATH_TO_FILE> (optional --set-as-default)
```
