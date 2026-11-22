# Small typed tools instead of a free-text action tool

The server exposes one strongly typed, risk-classed tool per capability, with a direct lxml DOM engine for simple edits and the Inkscape CLI (argument lists only) for render, export and geometry. We rejected a generic `run_action(string)` tool because it would allow overwriting originals, shell injection and unreversible edits; typed tools let the policy layer gate by risk class and make every mutation snapshot-backed. Adding capabilities therefore means adding tools, not widening an existing one.
