# Global Development Standards

Global instructions for all projects. A project's own CLAUDE.md overrides these.

Use skills proactively when they fit — suggest relevant ones, don't block on them.

## Operating principles

- **No speculative work.** No features, flags, config, or abstractions until actually
  needed. Don't abstract until you've written the same thing three times.
- **Clarity over cleverness.** Explicit and readable beats dense.
- **No phantom anything.** Don't document, validate, or scaffold what isn't
  implemented — no `TBD` placeholders, no dead code. Flag dead code you find.
- **Replace, don't deprecate.** A new implementation replaces the old — delete the
  old entirely. No shims, dual formats, or migration paths unless asked.
- **Justify dependencies.** Each is attack surface and maintenance. Prefer the
  stdlib and tools already in use.
- **Verify at every level.** Guardrails first, not last: linters, type checkers,
  tests, hooks. Prefer structure-aware tools (ast-grep, LSP, compiler) over text
  matching. Review your own output.
- **Know the blast radius.** Before a change to shared or system state (macOS
  defaults/LaunchServices, launchd, global config, shared branches, external
  services), state what it affects and check the after-state. Reversible → act;
  wide-reaching or irreversible → confirm first.
- **Bias toward action.** Decide and move on anything easily reversed; state the
  assumption. Ask before committing to interfaces, data models, architecture, or
  write/destructive operations on external services.
- **Finish the job.** Handle visible edge cases, clean up what you touched, flag
  adjacent breakage. Thoroughness, not gold-plating — don't invent scope.
- **Agent-native.** Prefer file-based state: transparent, portable, greppable. Any
  outcome a user can reach, an agent should be able to reach too.

## Writing

Default to concise — chat, commits, PRs, issues, Slack. Length is a cost; spend it
where it helps the reader.

- Lead with the outcome. First line = what happened or what to do.
- Cut, don't drop. Trim explanation, never substance — keep blast radius, rollback
  steps, ordering constraints, risks, and follow-ups.
- Structure over prose. Short bullets and small tables beat paragraphs; one idea per bullet.
- No filler. No preamble, restated context, self-congratulation, or hedging. Don't
  re-explain what the diff shows.
- Match length to stakes. One-line change → one-line note; production cutover →
  rollback + verification steps.
- Plain, factual language. A bug fix is a bug fix. Avoid: critical, crucial,
  essential, significant, comprehensive, robust, elegant.

## Code

- ≤100 lines/function, cyclomatic complexity ≤8, ≤5 positional params, ≤100-char lines.
- Google-style docstrings on non-trivial public APIs.
- Self-documenting code. If a comment explains *what*, refactor instead. No
  commented-out code — delete it, it's in git.
- Fail fast with actionable errors: what operation, what input, suggested fix. Never
  swallow exceptions silently.

## Testing

- Test behavior, not implementation. If a refactor breaks tests but not code, the
  tests were wrong.
- Cover edges and errors, not just the happy path — empty inputs, boundaries,
  malformed data, missing files, network failure. Every handled error path gets a test.
- Mock only boundaries: slow (network, fs), non-deterministic (time, randomness), or
  external services you don't control. Never mock your own logic.
- Verify tests catch failures — break the code, watch it fail, then fix. Mutation
  testing (`cargo-mutants`, `mutmut`) for coverage; property-based (`proptest`,
  `hypothesis`) for parsers, serialization, algorithms.

## Reviewing

Sync first (`git fetch origin`). Evaluate in order: architecture → code quality →
tests → performance. Per issue: `file:line`, concrete description, options with
tradeoffs when the fix isn't obvious, a recommendation — then ask before changing.

## Tooling

Look up the current stable version before adding a dependency, CI action, or tool —
don't assume from memory.

| use                     | instead of | for                                   |
| ----------------------- | ---------- | ------------------------------------- |
| `rg`                    | grep       | literal / log search                  |
| `fd`                    | find       | file finding                          |
| `ast-grep`              | grep       | structural search — calls, defs, imports |
| `trash`                 | `rm`       | recoverable. **Never `rm -rf`**       |
| `shellcheck` / `shfmt`  | —          | shell lint / format                   |
| `actionlint` / `zizmor` | —          | GitHub Actions lint / security        |

- **Python** (3.13): `uv` (deps/venv), `ruff check` + `ruff format`, `ty check`,
  `pytest -q`. Never pip/poetry/black/flake8/mypy. Pin exact versions (`==`);
  `pip-audit` before deploy. Tests mirror package layout under `tests/`.
- **Bash:** start with `set -euo pipefail`; lint `shellcheck` + `shfmt -d`.

## Environment (this machine)

macOS. Shell is zsh, no framework. Editors: Zed (primary), nvim (terminal).
Terminal: ghostty. Config lives in the `betaflag/dotfiles` repo, symlinked via GNU
stow — **edit the repo copy, not the symlink target**, and add new config as its own
stow package.

## Git & workflow

Before committing: re-read the diff for complexity/redundancy/naming; run the
relevant tests (not the whole suite); run linters + type checker and fix everything.

- Imperative subject ≤72 chars, one logical change per commit.
- Commits are SSH-signed — never disable signing.
- Never push to main/master or amend/rebase shared history — branch and PR.
- Never commit secrets — use `.env` (gitignored) + env vars.
- PRs describe what the diff does now and what a reviewer needs to merge safely — not
  the journey or alternatives.
