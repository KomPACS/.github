# Contributing to KomPACS

How we plan and track work. It applies to every repo in the org.

## Project

One board for all repos: [KomPACS Project #1](https://github.com/orgs/KomPACS/projects/1). Add each new issue to it. Free plan: there is no auto-add.

| Field | Values | Rule |
|---|---|---|
| Status | `Backlog` → `Ready` → `In progress` → `In review` → `Done` | `Ready` = clear and ranked. Pull from the top. |
| Goal | `Demo-ready`, `IRIS pilot`, `Later` | Empty Goal = not triaged. |
| Size | `S` ≤ 1 evening, `M` 2–3 evenings, `L` | Split `L` before `Ready`. |
| Start, Target | dates | Feed the Roadmap view. |

Views: **Board** (Goal ≠ Later), **Backlog** (grouped by Goal, manual order), **Roadmap** (Start/Target), **Mine** (assignee = @me).

No Priority field. Rank = Goal, then order in the Backlog view.

Keep 1–2 items `In progress` per person.

## Issues

- Type: `Feature`, `Bug` or `Task` (org issue types). Do not use labels for the kind.
- Title: the outcome in plain words. No prefix. Example: `Show priors named only in report text`.
- Body: what and why. Link the spec if there is one.
- Medium work (over 3 files, a new module, or a design choice): put the spec in the repo under `docs/plans/<date>-<slug>/`. The issue links it. The plan tasks stay in the plan, not on the board.
- Work that touches several repos: one parent `Feature` in the repo that owns the outcome. Add one sub-issue per repo.
- Close as "not planned" for duplicates, invalid issues, and won't-fix.

## Labels

| Label | Use |
|---|---|
| `contract` | Changes the API contract. Touches several repos. |
| `clinical` | Needs a clinician's review. |
| `data` | Dataset, loaders or data quality. |
| `security` | Security or privacy. |
| `blocked` | Waits on something outside the team. Say on what in a comment. |

`scripts/sync-labels.sh` syncs this set to all repos.

## Branches and PRs

- Branch: `<issue number>-<slug>`, from `main`.
- PR title: Conventional Commits (`feat:`, `fix(api):`, `docs:`).
- PR body: `Closes KomPACS/<repo>#<n>`.
- Squash merge only.
- Project workflows: PR opened → `In review`. Issue closed → `Done`.

## Claude and the board

The board must show the truth. Claude keeps it true after each delivered piece of work:

1. Make sure an issue exists and is on the board.
2. Set Goal and Size if they are empty.
3. Move the issue to `In progress` at the start.
4. Post a 1–3 line comment: what changed, what is next.
5. Open follow-ups as new `Backlog` issues.
6. Set `Done` only after the PR merged, or for work with no PR.

A decision made in chat without Claude: put it on the issue by hand.

The rules ship as a plugin in `KomPACS/kompacs-ai-toolkit`.

## Releases

Semver tags in `kompacs-app` and `kompacs-iris`. CI builds images to GHCR. `kompacs-deploy` pins exact versions. Never deploy `latest`.
