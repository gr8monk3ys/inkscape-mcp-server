@echo off
rem Lorenzo's launcher for the inkscape-mcp MCP server (registered in Claude Code as "inkscape").
rem The server finds Inkscape via shutil.which, so put its bin dir on PATH first.
set "PATH=C:\Program Files\Inkscape\bin;%PATH%"
rem Folders the server may read/write (;-separated). Override by setting it before launch.
if not defined INKSCAPE_MCP_WORKSPACE_ROOTS set "INKSCAPE_MCP_WORKSPACE_ROOTS=C:\Users\loren\Design"
rem Skip the FastMCP update banner on stderr.
if not defined FASTMCP_SHOW_SERVER_BANNER set "FASTMCP_SHOW_SERVER_BANNER=false"
uv run --directory "%~dp0.." inkscape-mcp
