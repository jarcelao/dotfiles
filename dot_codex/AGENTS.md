## Rules
- Always use `uv` to run Python code.
  - For ad-hoc CLI execution, use `uvx`
  - For external dependencies to ad-hoc scripts, use `uv run --with` or PEP 723 inline metadata
- Always use `pnpm` to run JavaScript code.
  - For ad-hoc CLI execution, use `pnpx`
- Write temporary files to a `$(pwd)/temp/` folder.
