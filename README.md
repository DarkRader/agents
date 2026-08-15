# Personal Agent Skills

Reusable skills for AI agents. A skill is a directory containing a `SKILL.md`
file and optional supporting files.

Included skills:

- `create-agentsmd`
- `handoff`
- `proofreader`
- `skill-creator`
- `teach`

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

## Install Script

The script is also available locally:

```sh
sh scripts/install-skills.sh
```

It accepts an optional repository URL and destination:

```sh
sh scripts/install-skills.sh [repository-url] [destination]
```

## Add a Skill

Create a top-level directory with a required `SKILL.md`:

```text
my-skill/
└── SKILL.md
```

Supporting files can be placed beside `SKILL.md`; the installer copies the
complete skill directory.
