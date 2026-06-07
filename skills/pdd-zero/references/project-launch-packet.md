# Project Launch Packet Template

Use this template when the user asks for a full project launch packet, PRD-like artifact, or saved planning document.

```markdown
# Project Launch Packet: [Project Name]

## 1. Pressure Test

Core hypothesis:
Target user:
Strongest reason to build:
Smallest useful scenario:
Main alternatives:
Likely failure modes:
MVP cut:
Decision: Proceed | Narrow first | Pause

## 2. PRD

Problem:
Users:
Jobs to be done:
MVP scope:
Non-goals:
User stories:
Functional requirements:
Data, privacy, permissions, and consent:
Platform and distribution constraints:
Success metrics:
Edge cases:
Open questions:

## 3. Decision Ledger

Accepted assumptions:
Blocked decisions:
Reversible decisions:
Hard-to-change decisions:
Out of scope:

## 4. Product Or Interface Direction

Product feel:
Primary surface:
Interaction model:
Information density:
Visual or interface rules:
States to design:
Do not do:

For non-UI tools:
CLI/API contract:
Configuration model:
Failure messages:
Logs and observability:

## 5. Implementation Slices

Slice 1:
- User value:
- Likely files/modules:
- Acceptance criteria:
- Test approach:
- Risks:
- Commit/version boundary:

Slice 2:
Slice 3:
Slice 4:
Release slice:

## 6. Verification And Bug-Hunt Plan

Critical behavior tests:
Manual verification:
Edge cases:
Bug-hunt checklist:
Definition of done:

## 7. Architecture Guardrails

Domain words:
Module boundaries:
Local/private data boundary:
Extension points:
Avoid:

## 8. Version Plan

Starting version:
Next milestone:
Release blockers:
Commit boundaries:
Changelog policy:
Do not ship yet:

## 9. Immediate Next Actions

1.
2.
3.
```
