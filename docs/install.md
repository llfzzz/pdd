# Installing PDD Skills

PDD ships as one repository with three separately installable skills.

## Install With `npx skills`

Install all PDD skills globally for Codex:

```sh
npx skills add llfzzz/pdd --skill '*' -g -a codex -y
```

Install a single skill:

```sh
npx skills add llfzzz/pdd --skill pdd-zero -g -a codex -y
npx skills add llfzzz/pdd --skill pdd-scope -g -a codex -y
npx skills add llfzzz/pdd --skill pdd-gate -g -a codex -y
```

List available skills without installing:

```sh
npx skills add llfzzz/pdd --list
```

Use a skill without installing:

```sh
npx skills use llfzzz/pdd --skill pdd-scope
```

## Install With The Script

Clone the repository:

```sh
git clone https://github.com/llfzzz/pdd.git
cd pdd
```

Install all skills:

```sh
scripts/install.sh all
```

Install one skill:

```sh
scripts/install.sh zero
scripts/install.sh scope
scripts/install.sh gate
```

The script calls `npx skills add llfzzz/pdd` with the matching `--skill` option.

## Install With GitHub CLI

If your GitHub CLI supports agent skills:

```sh
gh skill install llfzzz/pdd pdd-zero
gh skill install llfzzz/pdd pdd-scope
gh skill install llfzzz/pdd pdd-gate
```

Preview before installing:

```sh
gh skill preview llfzzz/pdd pdd-scope
```

## Choosing A Skill

- Use `pdd-zero` before a new product or app starts.
- Use `pdd-scope` before a coding agent edits files.
- Use `pdd-gate` before commit, tag, push, release, or publish work.
