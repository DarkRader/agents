# AGENTS.md

## Project Overview

`DarkRader/agents` is a curated repository of reusable skills for AI coding agents. Skills are packaged according to the open Agent Skills standard and distributed via [skills.sh](https://skills.sh).

### Included Skills

- **`create-agentsmd`**: Generates high-signal `AGENTS.md` files tailored for repositories.
- **`handoff`**: Manages clean context bridging across session boundaries, subagents, and tools.
- **`proofreader`**: Performs mechanical correction of grammar, punctuation, and spelling while preserving voice and structure.
- **`skill-creator`**: Comprehensive toolkit to design, evaluate, benchmark, and package agent skills.
- **`teach`**: Multi-session interactive learning workflow using stateful workspace artifacts.

---

## Directory Structure

```text
.
├── .github/
│   ├── release-please-config.json
│   └── workflows/
│       ├── create-release-notes.yaml
│       └── validate-skills.yaml
├── skills/
│   ├── <skill-name>/
│   │   ├── SKILL.md            # Required: main skill instructions & metadata
│   │   ├── scripts/            # Optional: helper Python/Bash scripts
│   │   ├── references/         # Optional: schemas and reference docs
│   │   └── assets/             # Optional: templates and visual assets
├── CHANGELOG.md
└── README.md
```

---

## Skill Authoring Standards

### 1. File Structure
Every skill resides in its own folder under `skills/<skill-name>/` and must contain a `SKILL.md` file.

### 2. YAML Frontmatter Requirements
All `SKILL.md` files must begin with valid YAML frontmatter:

```markdown
---
name: <skill-name>
description: <Concise, actionable description explaining what the skill does and when the agent should activate it.>
---

# Skill Title

Skill instructions, guidelines, workflows, and references...
```

### 3. Conventions
- **Naming**: Directory name and frontmatter `name` must match and use lowercase kebab-case (e.g. `code-review`, `skill-creator`).
- **Description**: Keep descriptions high-signal, specifying clear triggering conditions without bloated prose.
- **Self-Contained**: Place supporting templates, prompt partials, or scripts directly within the skill's subdirectory.

---

## Development Workflow

### Adding a New Skill
1. Create a directory: `skills/<new-skill-name>/`
2. Add `skills/<new-skill-name>/SKILL.md` with required frontmatter.
3. If helper scripts or benchmarks are needed, place them inside `skills/<new-skill-name>/scripts/` or `references/`.

### Validating Skills
Python validation utilities are available in `skills/skill-creator/scripts/`:
- **Quick syntax validation**:
  ```bash
  python3 skills/skill-creator/scripts/quick_validate.py skills/<skill-name>
  ```

---

## Commit & Release Process

This repository uses **Release Please** for automated changelog generation and semantic versioning.

### Conventional Commit Conventions
Always format commit messages following the Conventional Commits specification:

| Prefix | Changelog Section | Description |
| :--- | :--- | :--- |
| `feat:` | ✨ New Features | Adding a new skill or major feature |
| `fix:` | 🛠️ Fixes | Fixing a bug, invalid prompt schema, or broken script |
| `chore:` | 🧱 Updates & Improvements | Minor updates, dependency bumps, or maintenance |
| `docs:` | 📝 Documentation | Documentation updates (README, formatting docs) |
| `refactor:` | 🧹 Refactors | Restructuring instructions or scripts without altering behavior |
| `test:` | 🧪 Tests & Quality | Adding or updating evals and benchmarks |
| `ci:` | ⚙️ DevOps & CI/CD | GitHub Actions workflow modifications |

---

## Installation & Distribution

Users can consume skills from this repository using `skills.sh`:
- **Add all skills**: `npx skills add DarkRader/agents`
- **Add specific skill**: `npx skills add DarkRader/agents --skill <skill-name>`
