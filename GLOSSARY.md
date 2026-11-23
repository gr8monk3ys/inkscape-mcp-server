# inkscape-mcp

An MCP server that exposes Inkscape/SVG documents to agents through a bounded, typed, reversible tool surface.

## Language

**Document**:
An SVG opened into a tracked working copy and addressed by an opaque `doc_id`. The source file is never written again.
_Avoid_: File, drawing

**Working copy**:
The workspace-owned copy of a Document that all edits mutate.
_Avoid_: Draft, temp file

**Workspace**:
The sandboxed directory root holding working copies, snapshots, artifacts and exports. Every path is confined to it.
_Avoid_: Project folder

**Snapshot**:
A pre-mutation copy of a working copy that `restore_snapshot` can roll back to.
_Avoid_: Backup, checkpoint

**Operation Record**:
The audit entry written for every mutation, including its policy decision and artifacts.
_Avoid_: Log entry, history item

**Risk class**:
A tool's declared danger level: `low`, `medium`, `high` or `restricted`; the policy layer gates calls on it.
_Avoid_: Permission level, severity

**Approval token**:
A per-operation token, minted out of band, required to run a `high` risk operation.
_Avoid_: Confirm flag, API key

**Edit**:
A typed, validated change to a Document (for example `CreateRectEdit`, `DeleteObjectEdit`), applied through the edit pipeline and batchable.
_Avoid_: Patch, command

**Artifact**:
A rendered or exported output (preview, PNG, PDF) stored in the Workspace and referenced by a workspace-relative path.
_Avoid_: Output file

**Export profile**:
A named preset of export settings used for single and batch exports.
_Avoid_: Preset, template

**Action chain**:
An ordered list of Inkscape CLI actions run as one high-risk operation, checked against the Action capability map.
_Avoid_: Script, macro

**Engine**:
A backend that performs work on a Document: the direct-DOM engine (lxml) for structure, the Inkscape CLI adapter for render, export and geometry.
_Avoid_: Backend, driver

**Live session**:
A connection to a running Inkscape GUI through the helper extension, over a socket or D-Bus transport.
_Avoid_: Interactive mode

**Capability matrix**:
The runtime probe of which Inkscape features and versions are available on this host.
_Avoid_: Feature flags
