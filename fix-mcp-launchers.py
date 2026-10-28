#!/usr/bin/env python3
"""Make Muster Agent write an MCP server's launcher before handing it to an agent.

Upstream bug (agent 0.3.14 to 0.3.16; musterhq/muster-code#766):
servers imported from ~/.claude.json, ~/.codex/config.toml or a folder's
.mcp.json are stored by `syncDetected()` in
packages/agent-app/src/runtime/domains/mcp.ts, but only the add/update handlers
call `writeLauncher()`. The thread config still points every stdio server with
arguments at <dataDir>/mcp-launchers/<id>.sh, so detected servers start with a
missing command and the agent reports them as failed (ENOENT). Toggling a
server in Settings writes its launcher, which is why that works around it.

The patch rewrites the one place that hands the launcher path to the agent so
it (re)writes the launcher first, synchronously, when it is missing or stale.
That also covers launchers left behind after a detected server's command
changes. The bundle is minified, so the site is matched by shape, not by name;
the script refuses to touch anything unless it matches exactly once.

app.asar layout: an 8-byte size pickle, a header pickle holding JSON with
per-file {size, offset, integrity}, then the file data. Offsets are relative to
the end of the header, so the patched file is appended at the end of the data
and only its own header entry changes; the original bytes stay as dead space.

Usage: fix-mcp-launchers.py <app.asar>
"""
import hashlib
import json
import re
import struct
import sys

TARGET = ('dist', 'runtime', 'service.cjs')
MARKER = '/*muster-agent-bin:mcp-launchers*/'

# Z[`${oe}.command`]=ne.args.length?I(ne.id):ne.command
SITE = re.compile(
    r'(?P<cfg>[\w$]+)\[`\$\{(?P<key>[\w$]+)\}\.command`\]='
    r'(?P<srv>[\w$]+)\.args\.length\?(?P<path>[\w$]+)\((?P=srv)\.id\):(?P=srv)\.command'
)
# function iK(t,e=process.platform){return e==="win32"?`@echo off ... -- the launcher script builder.
SCRIPT = re.compile(r'function (?P<name>[\w$]+)\(t,e=process\.platform\)\{return e==="win32"\?`@echo off')


def die(msg):
    sys.exit(f'fix-mcp-launchers: {msg}')


def read_asar(path):
    with open(path, 'rb') as f:
        blob = f.read()
    size_pickle_payload, header_pickle_size = struct.unpack_from('<II', blob, 0)
    if size_pickle_payload != 4:
        die('not an asar archive')
    payload_size, json_len = struct.unpack_from('<II', blob, 8)
    header = json.loads(blob[16:16 + json_len])
    data = blob[8 + header_pickle_size:]
    return header, data


def write_asar(path, header, data):
    raw = json.dumps(header, separators=(',', ':')).encode()
    pad = (-len(raw)) % 4
    payload = struct.pack('<I', len(raw)) + raw + b'\0' * pad
    header_pickle = struct.pack('<I', len(payload)) + payload
    size_pickle = struct.pack('<II', 4, len(header_pickle))
    with open(path, 'wb') as f:
        f.write(size_pickle + header_pickle + data)


def integrity(content, block_size):
    return {
        'algorithm': 'SHA256',
        'hash': hashlib.sha256(content).hexdigest(),
        'blockSize': block_size,
        'blocks': [hashlib.sha256(content[i:i + block_size]).hexdigest()
                   for i in range(0, max(len(content), 1), block_size)],
    }


def patch_source(src):
    if MARKER in src:
        return None
    sites = list(SITE.finditer(src))
    if len(sites) != 1:
        die(f'expected one launcher site in service.cjs, found {len(sites)}; upstream changed, review the patch')
    scripts = list(SCRIPT.finditer(src))
    if len(scripts) != 1:
        die(f'expected one launcher script builder, found {len(scripts)}; upstream changed, review the patch')
    m, script = sites[0], scripts[0].group('name')
    cfg, key, srv, path = m.group('cfg', 'key', 'srv', 'path')
    ensure = (
        '((p,c)=>{try{let f=require("fs");f.mkdirSync(require("path").dirname(p),{recursive:!0});'
        'let o;try{o=f.readFileSync(p,"utf8")}catch{}o!==c&&f.writeFileSync(p,c,{mode:448})}catch{}return p})'
        f'({path}({srv}.id),{script}([{srv}.command,...{srv}.args]))'
    )
    replacement = f'{cfg}[`${{{key}}}.command`]={srv}.args.length?{MARKER}{ensure}:{srv}.command'
    return src[:m.start()] + replacement + src[m.end():]


def main():
    if len(sys.argv) != 2:
        die('usage: fix-mcp-launchers.py <app.asar>')
    asar = sys.argv[1]
    header, data = read_asar(asar)
    node = header
    for part in TARGET:
        node = node.get('files', {}).get(part)
        if node is None:
            die('/'.join(TARGET) + ' not found in the archive')
    if node.get('unpacked'):
        die('service.cjs is unpacked; nothing to patch inside the archive')
    start, size = int(node['offset']), node['size']
    patched = patch_source(data[start:start + size].decode('utf-8'))
    if patched is None:
        print('fix-mcp-launchers: already patched')
        return
    content = patched.encode('utf-8')
    block_size = node.get('integrity', {}).get('blockSize', 4 * 1024 * 1024)
    node['offset'] = str(len(data))
    node['size'] = len(content)
    node['integrity'] = integrity(content, block_size)
    write_asar(asar, header, data + content)
    print(f'fix-mcp-launchers: patched {"/".join(TARGET)} ({size} -> {len(content)} bytes)')


if __name__ == '__main__':
    main()
