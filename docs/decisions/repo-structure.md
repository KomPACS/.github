# Repo structure

Decided 2026-10-20.

| Repo | Visibility | Owns |
|---|---|---|
| `kompacs-app` | private | UI, API, MCP server, the one `contract/openapi.json`, UI mock mode |
| `kompacs-iris` | private (see .github#6) | FHIR/HL7 setup, loaders, SQL projection, vector tables |
| `kompacs-deploy` | private | Compose bundle, `envs/<site>/` config, install/smoke/reset scripts, pinned versions |
| `demo` | public | Static mocked demo. Replaced by the app's mock mode after `Demo-ready`. |
| `docs`, `kompacs-web`, `.github`, `kompacs-ai-toolkit` | as is | Docs, marketing site, org rules, agent plugins |

`rakathon` is archived. New repos start clean.

## Why

- A hospital dev environment needs versioned images and one config, not source. So the cut is code vs. config, plus IRIS as a module.
- UI and API share the contract and change together. Two devs pay one PR per repo boundary. The seam is the contract with a CI drift check, not a repo boundary.
- IRIS has its own release rhythm and may go public on Open Exchange.
- Site config stays away from code that may go public.
- Docs fetch `openapi.json` from the latest `kompacs-app` release. There are no hand copies.
- New repos come after `Demo-ready`. Setup must not delay the demo.
