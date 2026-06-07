# pdd

Plan-Driven Development skills for coding agents.

PDD is a small skill pack for reducing agent rework. It helps an agent lock the right product, implementation, and release decisions before it mutates a repository or publishes unfinished work.

## Skills

| Skill | Use it when | What it prevents |
| --- | --- | --- |
| `pdd-zero` | Starting from a rough product, app, tool, SaaS, automation, or game idea | Building before the product, privacy, design, implementation, and version path are coherent |
| `pdd-scope` | Asking an agent to implement, fix, refactor, automate, or script something | Wrong-scope implementation, unnecessary abstractions, duplicate dependencies, and unverified changes |
| `pdd-gate` | Planning a release, version bump, commit, tag, push, or publish action | Shipping local experiments, incomplete version metadata, or unreviewed release blockers |

## Why Switch To PDD?

Most planning skills stop at a task plan. PDD adds decision gates:

- `pdd-zero` turns a vague idea into a launch packet with a decision ledger.
- `pdd-scope` makes the agent prove the minimal implementation route before editing.
- `pdd-gate` separates public, pushed, committed-only, uncommitted, excluded, and blocked work before release actions.

The goal is not slower development. The goal is fewer wrong turns, cleaner commits, and fewer moments where an agent confidently builds or ships the wrong thing.

## Install

Install every skill globally for Codex:

```sh
npx skills add llfzzz/pdd --skill '*' -g -a codex -y
```

Install one skill:

```sh
npx skills add llfzzz/pdd --skill pdd-scope -g -a codex -y
```

Use the convenience script from a clone of this repo:

```sh
scripts/install.sh all
scripts/install.sh zero
scripts/install.sh scope
scripts/install.sh gate
```

GitHub CLI users with agent skill support can also install a specific skill:

```sh
gh skill install llfzzz/pdd pdd-scope
```

See [docs/install.md](docs/install.md) for details.

## Use

Example prompts:

```text
Use pdd-zero to turn this rough Mac app idea into a launch packet before coding.
```

```text
Use pdd-scope before implementing this feature. I want the smallest safe change.
```

```text
Use pdd-gate to check whether this branch is ready to tag and push.
```

Chinese trigger phrases are included in the skill descriptions where useful, so prompts such as `从0到1`, `新项目`, `发版`, `上线`, and `推送版本` can still route naturally.

## Repository Shape

Each skill is independently installable from `skills/<skill-name>/` and includes its own `SKILL.md` plus evaluation prompts.

```text
skills/
  pdd-zero/
  pdd-scope/
  pdd-gate/
```

The structure follows common agent skill conventions: a skill is a directory containing a `SKILL.md` file with `name` and `description` frontmatter. The Vercel skills CLI supports installing all skills from a repo or selecting specific skills with `--skill`. GitHub's agent skills docs describe the same `SKILL.md` package model and `gh skill` installation flow.

## License

MIT. See [LICENSE](LICENSE).
