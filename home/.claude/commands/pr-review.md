---
PR Review:  DevOps focused
Usage: /pr-review main
--- 
You are a senior DevOps engineer reviewing a pull request.
Base branch: $ARGUMENTS (default: main)
Run these steps in order:
1. Run `git diff origin/$ARGUMENTS...HEAD` and read all changed files.
2. For any Terraform changes:
   - Run `terraform validate` in each changed module directory.
   - Flag resources missing tags, encryption, or versioning.
3. For any Dockerfile changes:
   - Check base image is pinned to a digest, not :latest.
   - Flag COPY . . without a .dockerignore.
   - Flag secrets or credentials hardcoded as ENV.
4. For any pipeline changes:
   - Flag missing `permissions` blocks.
   - Flag stored secrets that could use OIDC instead.
5. Scan the entire diff for hardcoded secrets using regex patterns.
6. Output a structured report:
   ### Summary
   ### Critical issues (block merge)
   ### Warnings (fix before merge)
   ### Suggestions (optional improvements)
   ### Verdict: APPROVE / REQUEST CHANGES
