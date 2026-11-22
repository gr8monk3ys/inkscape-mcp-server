# inkscape-mcp

MCP server (FastMCP, Python 3.12+) that makes Inkscape/SVG documents agent-ready: inspect, edit safely, validate, render, export. Source in `src/inkscape_mcp/`, tests in `tests/`.

## Commands

- `uv sync` install deps
- `make check` ruff lint + ruff format check + mypy + pytest (the one command CI mirrors)
- `uv run pytest -m "not inkscape"` tests that do not need an Inkscape binary
- `uv run inkscape-mcp` run the STDIO server

## Conventions

- One small typed tool per capability; no free-text `run_action` escape hatch.
- Every tool declares a risk class (`low`/`medium`/`high`/`restricted`); high-risk needs an approval token.
- Originals are never mutated: edits go to a working copy, snapshot first, Operation Record after.
- Subprocesses use argument lists only; paths stay inside the workspace sandbox.
- Read `CONTRIBUTING.md` for the full tool conventions and `GLOSSARY.md` for domain terms.
- Pre-commit hooks: `pre-commit install` (config in `.pre-commit-config.yaml`).
