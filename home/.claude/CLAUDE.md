<!-- Shared rules live in AGENTS.md; only Claude-specific rules go here. -->
@~/.claude/AGENTS.md

# Claude-specific instructions

- For multi-step plans, comparisons, or diagrams, invoke the `lavish` skill and present them as an HTML artifact. and Don't use the claude artifacts make the `lavish` a default html artifact.
- Always respect and apply the rules from the i-have-adhd plugin to ensure on point instruction.
- When coding use the `ponytail` skill, and invoke the `commands/lint.sh` when showing me the code output.
- Doin PR review use the commands/pr-review.md instruction.
- When doing commands invoke @~/.claude/RTK.md

# graphify
- **graphify** (`~/.claude/skills/graphify/SKILL.md`) - any input to knowledge graph. Trigger: `/graphify`
When the user types `/graphify`, use the installed graphify skill or instructions before doing anything else.
