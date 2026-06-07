---
name: pdd-gate
description: Govern releases, version bumps, commits, tags, pushes, and publishing actions before Git or distribution state changes. Use this whenever the user asks about release readiness, 发版, 上线, 推送版本, release, tag, version bump, changelog, whether a build can ship, or how to separate local WIP from public code.
license: MIT
---

# PDD Gate

Use this skill before release, version, commit, tag, push, or publish actions. The goal is to make the agent distinguish what is public, pushed, local, excluded, and blocked before it mutates Git state or distribution state.

## Operating Rule

Never stage, commit, tag, push, publish, upload artifacts, or create releases unless the user explicitly asks for that action.

A status check or version plan is read-only. If the user asks to execute a Git or release action, state the exact boundary first, inspect the staged or target state, and only then perform the requested action.

## Release Map

Before recommending a release action, build this map:

```text
Public/tagged:
Pushed:
Committed-only:
Uncommitted:
Excluded:
Blockers:
```

This is PDD Gate's main differentiator. It prevents experimental code, local-only data systems, private files, generated artifacts, or incomplete metadata from being promoted accidentally.

## Intake Workflow

Inspect source of truth instead of relying on memory:

1. Project instructions: `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, release docs.
2. Git state: branch, remote, recent commits, tags, upstream difference, uncommitted work.
3. Version metadata: package manifests, app metadata, changelog, release scripts, build numbers.
4. Release automation: CI, signing, packaging, notarization, deployment, upload, or publish scripts.
5. User-stated exclusions: experiments, sidecars, local data collection, training, private files, or future scope.

Use `rg` or project-native tools first. Do not infer current version, pushed state, or release blockers from old context if it can be checked.

## Version Policy

Prefer SemVer unless the project has a stronger policy:

- Patch: bug fixes, docs corrections, packaging fixes, naming fixes, release metadata.
- Minor: new user-facing capability, workflow expansion, settings surface, notable behavior change.
- Major: stable public promise, breaking behavior, migration burden, platform shift, or deliberate milestone.
- Pre-release: unstable external testing or ecosystem-supported beta builds.

For pre-`1.0` products, do not rush to `1.0.0`; reserve it for a release with stable scope, support promise, and distribution path.

## Decision Gates

Use these release decisions:

- Green: scope, metadata, changelog, tests, packaging, signing/deploy, and blockers are aligned.
- Yellow: safe for local artifact, internal test, draft release, or planning commit only.
- Red: do not tag or publish; release scope or blocker is unresolved.

Recommend the smallest safe next action, such as documenting a planned version, running tests, staging only a specific scope, or deferring a tag.

## Commit, Tag, Push Protocol

If the user asks for a commit:

1. State the commit boundary.
2. Identify excluded files or features.
3. Stage only that boundary.
4. Inspect staged diff.
5. Run relevant checks or state why not.
6. Commit with a message that matches the scope.

If the user asks for a tag:

1. Verify version metadata matches the tag.
2. Verify changelog or release notes.
3. Verify tests and packaging status.
4. Warn if public-release blockers remain.
5. Create or push the tag only after explicit instruction.

If the user asks to push:

1. Confirm branch and remote.
2. State whether tags are included.
3. Push only the requested branch or tag set.

## Examples

Example 1: The app builds and tests pass, but signing or account approval is missing.

Decision: Yellow. The code may be suitable for a local/internal artifact, but not a public release.

Example 2: A branch contains finished UI work plus an untracked local data-collection sidecar.

Decision: Stage and ship only the UI work. Put the sidecar in `Excluded` unless the user explicitly promotes it.

Example 3: The user asks to tag `v0.3.0`, but metadata still says `0.2.0`.

Decision: Red for tagging. Align version metadata and changelog first.

## Output Shapes

Release status:

```markdown
**Release Status**
Release Map:
Version metadata:
Release blockers:
Decision:
Recommended next action:
```

Version plan:

```markdown
**Version Plan**
Current baseline:
Next patch:
Next minor:
Deferred scope:
Do not include:
Required checks:
```

Pre-action review:

```markdown
**Pre-Action Review**
Target:
Included:
Excluded:
Version metadata:
Checks:
Risks:
Decision:
```
