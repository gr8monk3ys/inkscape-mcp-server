# Lorenzo's setup (branch `lorenzo`)

Personal config for this fork. Upstream fixes go on their own `fix/*` branches and PRs to
jjjsood/inkscape-mcp-server; this branch = upstream `main` + those fixes + this folder.

- `inkscape-mcp-launch.cmd` - what Claude Code runs. Register once:
  `claude mcp add -s user inkscape -- C:\Users\loren\Code\additional\inkscape-mcp\local\inkscape-mcp-launch.cmd`
- Workspace root: `C:\Users\loren\Design` (the server refuses paths outside it). Add more roots
  `;`-separated in the launcher.
- Startup takes ~18s (runtime probe), so the first `claude mcp get` can time out once.

Usage notes: high-risk tools (`set_document_svg`, deletes, path booleans) need any non-empty
`approval_token`; `set_font(size=...)` takes a CSS length string like `"62px"`; saves never
overwrite without approval.

Updating: `git fetch upstream && git merge upstream/main` on this branch; drop a `fix/*` branch's
commits once its PR is merged upstream.
