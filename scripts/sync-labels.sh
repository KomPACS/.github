#!/usr/bin/env bash
# Sync the KomPACS label set to every non-archived org repo. Deletes labels not in the set.
# Run: scripts/sync-labels.sh [repo ...]
set -euo pipefail

ORG=KomPACS
LABELS=(
  "contract|1d76db|Changes the API contract, touches several repos"
  "clinical|d93f0b|Needs a clinician's review"
  "data|0e8a16|Dataset, loaders or data quality"
  "security|b60205|Security or privacy"
  "blocked|000000|Waits on something outside the team"
)

repos=("$@")
if [ ${#repos[@]} -eq 0 ]; then
  while read -r name; do repos+=("$name"); done < <(gh repo list "$ORG" --no-archived --limit 100 --json name --jq '.[].name')
fi

for repo in "${repos[@]}"; do
  echo "== $ORG/$repo"
  keep=()
  for entry in "${LABELS[@]}"; do
    IFS='|' read -r name color desc <<<"$entry"
    gh label create "$name" -R "$ORG/$repo" --color "$color" --description "$desc" --force
    keep+=("$name")
  done
  gh label list -R "$ORG/$repo" --limit 200 --json name --jq '.[].name' | while read -r name; do
    if ! printf '%s\n' "${keep[@]}" | grep -qxF "$name"; then
      gh label delete "$name" -R "$ORG/$repo" --yes
    fi
  done
done
