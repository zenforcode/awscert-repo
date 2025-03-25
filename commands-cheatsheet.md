# AWS CLI commands cheatsheet
# ✅ AWS CLI IAM Commands Guide

```bash
# To display help for AWS CLI
aws help

# To configure AWS CLI with credentials, region, and output format
aws configure
```

---

## 🔐 IAM (Identity and Access Management)

IAM is a web service that helps you securely control access to AWS resources. With IAM, you can manage users, groups, roles, and their permissions.

---

### 👤 User Information

```bash
# Get details of the current authenticated IAM user
aws iam get-user
```

---

### 📋 View IAM Policies

```bash
# List policies attached to a specific user
aws iam list-attached-user-policies --user-name <USER_NAME>

# Display attached policies in table format
aws iam list-attached-user-policies --user-name <USER_NAME> --output table

# List all available IAM policies
aws iam list-policies

# List policy names and ARNs (text or table format)
aws iam list-policies --query 'Policies[*].[PolicyName, Arn]' --output text
aws iam list-policies --query 'Policies[*].[PolicyName, Arn]' --output table
```

---

### ➕ Attach / Detach IAM Policies

```bash
# Attach a policy to a user
aws iam attach-user-policy --user-name <USER_NAME> --policy-arn <POLICY_ARN>

# Detach a policy from a user
aws iam detach-user-policy --user-name <USER_NAME> --policy-arn <POLICY_ARN>

# Example of POLICY_ARN format:
# arn:aws:iam::<ACCOUNT_ID>:policy/<POLICY_NAME>
```

---

### 🛠️ Create IAM Policies

```bash
# Create a new policy from a JSON file
aws iam create-policy --policy-name <POLICY_NAME> --policy-document file://<PATH_TO_FILE>

# Create a new version of an existing policy from a JSON file
aws iam create-policy-version \
  --policy-arn <POLICY_ARN> \
  --policy-document file://<PATH_TO_FILE> \
  [--set-as-default]
```
