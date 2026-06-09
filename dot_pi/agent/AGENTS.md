## Rules
- Use `uv` for any Python-related tasks.
  - For ad-hoc CLI execution, use `uvx`
  - For external dependencies to ad-hoc scripts, use `uv run --with` or PEP 723 inline metadata
- Write temporary files to a `$(cwd)/temp/` folder.
