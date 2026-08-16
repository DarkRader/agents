#!/bin/sh

set -eu

repo_url="${1:-https://github.com/DarkRader/agents.git}"
destination="${2:-$HOME/.agents/skills}"
tmp_dir="$(mktemp -d)"

cleanup() {
  rm -rf "$tmp_dir"
}

trap cleanup EXIT INT TERM

git clone --depth 1 "$repo_url" "$tmp_dir/agent-skills"
mkdir -p "$destination"

installed=0

for skill_dir in "$tmp_dir/agent-skills/skills"/*; do
  [ -d "$skill_dir" ] || continue
  [ -f "$skill_dir/SKILL.md" ] || continue

  skill_name="${skill_dir##*/}"
  mkdir -p "$destination/$skill_name"
  cp -R "$skill_dir"/. "$destination/$skill_name/"
  printf 'Installed %s\n' "$skill_name"
  installed=$((installed + 1))
done

if [ "$installed" -eq 0 ]; then
  printf 'No skills were found in %s\n' "$repo_url" >&2
  exit 1
fi

printf 'Installed %s skill(s) in %s\n' "$installed" "$destination"
