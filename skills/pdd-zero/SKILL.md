---
name: pdd-zero
description: Turn a rough product, app, website, SaaS, game, automation, or coding project idea into a decision-ready launch packet before implementation. Use this whenever the user starts a new project, says "from zero", "MVP", "PRD", "vibecoding", "vibe coding", "new project", "从0到1", "新项目", "做个产品", "需求梳理", or asks for an end-to-end AI coding workflow.
license: MIT
---

# PDD Zero

Use this skill to move from idea to launch packet without letting the agent start building too early.

The output should reduce rework by making product direction, implementation slices, privacy boundaries, and release assumptions visible before code changes.

## Operating Rule

Do not implement code as part of this skill unless the user explicitly asks for execution after the launch packet exists. If the user asks to build immediately, produce the launch packet first, then identify the first implementation slice.

Prefer momentum over long interviews. Ask only when the answer changes product direction, data/privacy risk, release path, or core architecture. If a reasonable default exists, state it in the Decision Ledger and continue.

## Workflow

1. Pressure-test the idea.
2. Convert the idea into a compact PRD.
3. Create a Decision Ledger.
4. Define product/interface direction.
5. Split work into vertical implementation slices.
6. Define verification and bug-hunt checkpoints.
7. Add architecture guardrails.
8. Create an initial version and release plan.
9. End with immediate next actions.

Use `references/project-launch-packet.md` when you need the full output template. Keep the user-facing response compact unless they ask for the full packet.

## Decision Ledger

Every launch packet should include a Decision Ledger:

- Accepted assumptions: defaults the agent can proceed with.
- Blocked decisions: choices that must be answered before implementation or release.
- Reversible decisions: choices that can change later with low cost.
- Hard-to-change decisions: choices that affect data, architecture, distribution, privacy, or user trust.

This is PDD Zero's main differentiator. It keeps speed while making guesses visible.

## Pressure Test

Check:

- Target user and frequency of pain.
- Core job the product performs.
- Smallest scenario where the product is obviously useful.
- Why users may not care, trust it, adopt it, or pay for it.
- Platform, distribution, account, budget, model/API, legal, or privacy constraints.
- What can be cut from the MVP without killing the value.

Decision values:

- `Proceed`: coherent enough to plan.
- `Narrow first`: useful idea but too broad.
- `Pause`: blocked by a missing premise or external dependency.

## PRD Rules

Keep the PRD implementation-ready:

- Problem from the user's perspective.
- Target users and jobs.
- MVP scope and non-goals.
- Functional requirements.
- Data, privacy, permissions, and consent requirements.
- Platform and distribution constraints.
- Success metrics.
- Edge cases and open questions.

Do not invent data, business claims, legal posture, or user research. Mark unknowns as assumptions.

## Implementation Slices

Use vertical slices. Each slice should deliver one user-visible path or one verifiable operating capability.

Prefer this order:

1. Skeleton that runs.
2. First real user flow.
3. Persistence or external integration.
4. Settings, error states, and edge cases.
5. Packaging and release readiness.

For each slice, include user value, acceptance criteria, test approach, and release or commit boundary.

## Verification And Bug-Hunt

Define checks before implementation:

- Behavior tests at the highest practical interface.
- Manual verification for the first user flow.
- Empty, loading, error, permission, and data-loss states.
- One likely edge case per slice.
- Console, logs, or CI checks when relevant.

## Version Plan

Use conservative versioning unless the project already has a policy:

- `0.1.0`: first runnable MVP or internal test build.
- `0.2.0`: meaningful user-facing expansion.
- Patch versions: fixes, docs, packaging, or release metadata.
- `1.0.0`: stable public promise and distribution path.

Call out blockers such as signing, notarization, app store approval, hosting, privacy policy, payment setup, data consent, or model/API cost.

## Output Shape

Use this compact shape by default:

```markdown
**Project Launch Packet**
Pressure test:
PRD:
Decision Ledger:
Product/interface direction:
Implementation slices:
Verification plan:
Architecture guardrails:
Version plan:
Immediate next actions:
```

If the user asks for a file or a full planning artifact, expand using `references/project-launch-packet.md`.
