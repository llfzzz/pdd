# Why PDD?

Plan-Driven Development is for users who already use capable coding agents but still see the same failure pattern:

1. The agent starts before the real goal is clear.
2. The agent implements a broader change than needed.
3. The agent mixes finished work with experiments.
4. The release state becomes hard to reason about.

PDD is a small set of decision gates that makes the agent slow down only where mistakes are expensive.

## Compared With Generic Planning Skills

Generic implementation planners are useful, but they often stop at "steps to do the task." `pdd-scope` adds a scope lock:

- required behavior
- explicit non-goals
- existing reuse options
- minimal route
- verification
- stop conditions

The agent should not edit until those are coherent.

## Compared With Project-Brainstorming Skills

Brainstorming can produce many ideas. `pdd-zero` turns one idea into a launch packet and a decision ledger:

- accepted assumptions
- blocked decisions
- reversible decisions
- hard-to-change decisions

That ledger helps a user keep momentum without forgetting what was guessed.

## Compared With Release Checklists

Release checklists often ask whether tests pass. `pdd-gate` first asks what state each piece of work is in:

- public or tagged
- pushed
- committed-only
- uncommitted
- excluded
- blocked

This protects against accidentally shipping local experiments, private data work, training pipelines, or incomplete version metadata.

## Design Principle

PDD should make the agent more useful, not more ceremonial. Ask only questions that change a decision. Use reasonable defaults when the risk is low. Stop the agent when the next action would mutate code, Git state, or public distribution without enough clarity.
