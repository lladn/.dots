---
Hotfix workflow
Usage: /hotfix TicketID "timeout on retries"
---
Parse $ARGUMENTS as: TICKET DESCRIPTION
Steps:
1. `git checkout main && git pull`
2. `git checkout -b hotfix/$TICKET`
3. Ask me: "What files need to change and what's the fix?"
4. Apply the fix to the relevant files, and use necessary debug if no intent. 
5. Run a test depend on the type of application or repo - abort if tests fail.
6. Show me `git diff --stat` and wait for explicit confirmation.
7. `git add -p` then commit: `fix($TICKET): $DESCRIPTION`
8. `git push -u origin hotfix/$TICKET`
9. Open a PR to main with a generated description.
