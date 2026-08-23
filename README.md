# Personal Agent Skills

Reusable skills for AI agents. A skill is a directory containing a `SKILL.md`
file and optional supporting files.

## Publish on skills.sh

Skills on `skills.sh` are sourced from public GitHub repositories; there is no
separate upload destination. This repository is discoverable as:

```text
npx skills add DarkRader/agents
```

The `Validate Skills` GitHub Action checks every pull request and every change
to `main` with the Agent Skills validator. To publish a version, run the
`Publish Skills` workflow from the GitHub Actions tab and provide a semver tag,
such as `v1.0.0`. It validates the skills, adds the `agent-skills` repository
topic, and creates a GitHub release.

Use one release workflow for a given version. If you publish with `Publish
Skills`, do not also create the same release through Release Please.

Published versions can be pinned when users install a skill:

```sh
npx skills add DarkRader/agents --skill proofreader
```

To validate locally, install a current GitHub CLI and run:

```sh
gh skill publish --dry-run
```

The repository can also be opened directly at `https://skills.sh/DarkRader/agents` after it has been indexed.

Included skills:

- `create-agentsmd`
- `handoff`
- `proofreader`
- `skill-creator`
- `teach`

Repository layout:

```text
skills/
├── create-agentsmd/
├── handoff/
├── proofreader/
├── skill-creator/
└── teach/
```

## Install Globally

The installer clones this repository into a temporary directory, copies only
the skill directories, and removes the temporary clone. No `.git` directory or
repository files are installed.

Run this from anywhere:

```sh
curl -fsSL https://raw.githubusercontent.com/DarkRader/agents/main/scripts/install-skills.sh | sh
```

The default destination is:

```text
~/.agents/skills/<skill-name>/SKILL.md
```

After installing, restart your agent or reload its skills. Verify the result:

```sh
find "$HOME/.agents/skills" -mindepth 2 -maxdepth 2 -name SKILL.md -print
```

If your agent uses another global directory, pass it as the second argument.
For example:

```sh
curl -fsSL https://raw.githubusercontent.com/DarkRader/agents/main/scripts/install-skills.sh | sh -s -- https://github.com/DarkRader/agents.git "$HOME/.codex/skills"
```

## Add a Skill

Create a directory under `skills/` with a required `SKILL.md`:

```text
skills/
└── my-skill/
    └── SKILL.md
```

Supporting files can be placed beside `SKILL.md`; the installer copies the
complete skill directory.
