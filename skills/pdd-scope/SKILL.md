---
name: pdd-scope
description: Lock coding scope before a coding agent edits files. Use this before implementation, bug fixes, refactors, scripts, automation, migrations, dependency additions, or any request where the agent should review requirements, choose the smallest safe route, reuse existing code or libraries before building, and define verification before mutation.
license: MIT
---

# PDD Scope

Use this skill before code changes. The goal is to make the agent prove what it will change, why that is the smallest sufficient route, and how success will be verified.

## Operating Rule

Do not edit code until the Scope Lock is coherent. If the user asks for immediate implementation, create the Scope Lock first, then proceed only after the plan is concrete enough to execute without inventing decisions mid-change.

Ask only when an unanswered question can materially change behavior, data shape, security, compatibility, or user-facing output. If the ambiguity is low risk, choose the conservative default and record it.

## Scope Lock

Use this structure for substantial coding work:

```text
Goal:
Required behavior:
Non-goals:
Existing reuse options:
Minimal route:
Verification:
Stop conditions:
```

For small tasks, keep this internal but still follow it.

## Requirement Review

Before editing, identify:

- The concrete user-visible goal.
- Inputs, outputs, constraints, and non-goals.
- Affected files, modules, services, commands, or external systems.
- Assumptions and any blocking decisions.
- Acceptance checks: tests, builds, browser checks, CLI commands, or manual verification.

Restate only the parts that reduce risk. Do not create ceremony for obvious one-line tasks.

## Reuse-Before-Build Check

Before hand-building functionality, inspect in this order:

1. Current project patterns, helpers, components, schemas, APIs, and tests.
2. Current dependencies and lockfiles.
3. Official framework or SDK documentation for named tools.
4. Maintained open-source libraries only when local options do not cover the need.

Add a dependency only when it materially reduces risk or total code. Compare candidates by maintenance, license, size, security posture, API fit, and integration cost. Prefer direct library use over copying source.

## Minimal Route Discipline

Keep implementation narrow:

- Reuse existing project conventions.
- Avoid unrelated refactors, formatting churn, renames, or cleanup.
- Add abstractions only when they remove real complexity or match an existing pattern.
- Make every new line traceable to the requirement, acceptance check, or integration glue.
- Delete dead code only when it is directly caused by the requested change and safe.
- Avoid comments that merely narrate obvious code.

## Stop Conditions

Pause and ask before editing when:

- The requested behavior conflicts with existing product rules or public APIs.
- Multiple plausible data models or user-facing behaviors exist.
- The change may affect security, privacy, billing, legal, medical, financial, or release posture.
- The implementation requires a new dependency whose tradeoff is not obvious.
- Verification cannot be defined.

Do not stop for questions that repo inspection can answer.

## Pre-Final Review

Before claiming completion:

- Compare the diff to the Scope Lock.
- Remove unrelated changes.
- Confirm edge cases implied by the requirement are handled.
- Confirm errors are not silently ignored.
- Run the defined verification, or state the exact blocker and risk.
- Confirm no user changes were reverted.

## Output Shape

For planning-only requests:

```markdown
**Scope Lock**
Goal:
Required behavior:
Non-goals:
Existing reuse options:
Minimal route:
Verification:
Stop conditions:
```

For implementation requests, give a concise Scope Lock update before editing when the work is non-trivial, then implement and report verification evidence.
