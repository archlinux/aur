#!/usr/bin/env python

import sys
import os
from pathlib import Path
from ldif import LDIFWriter, LDIFRecordList
from io import StringIO, BytesIO

def exitWithUsage():
    print(f"Usage:")
    print(f"  {sys.argv[0]} <scripts.ldif> [/usr/share/jans/script-catalog] [db]")
    exit(-1)

# Based on jans/jans-linux-setup/jans_setup/setup_app/utils/crypto64.py
def get_scripts(catalogFolder):
    scripts = {}
    for ep in Path(catalogFolder).glob("**/*"):
        if ep.is_file() and ep.suffix.lower() in ['.py', '.java']:
            base = ep.relative_to(catalogFolder).parent
            extension_type = base.as_posix().lower().replace(os.path.sep, '_').replace('-','_')
            extension_script_name = '{}_{}'.format(extension_type, ep.stem.lower())

            scripts[extension_script_name] = ep.as_posix()

            extension_type = base.parent.as_posix().lower().replace(os.path.sep, '_').replace('-','_')
            extension_script_name = '{}_{}'.format(extension_type, ep.stem.lower())

            scripts[extension_script_name] = ep.as_posix()

    return scripts

if len(sys.argv) < 2:
    exitWithUsage()

scriptsFile = sys.argv[1]
catalogFolder = '/usr/share/jans/script-catalog'

if len(sys.argv) >= 3:
    catalogFolder = sys.argv[2]

db = False
if len(sys.argv) >= 4 and sys.argv[3].lower() == 'db':
    db = True

ldif = LDIFWriter(sys.stdout, cols=1000, base64_attrs=['jansScr'])

scripts = get_scripts(catalogFolder)

with open(scriptsFile) as lf:
    # Python ldif parser doesn't like `version`
    data = lf.read().replace('jansScr::%(', 'jansScr: ').replace('version: 1\n', '')
    ldifrecords = LDIFRecordList(StringIO(data))
    ldifrecords.parse_entry_records()
    for pair in ldifrecords.all_records:
        scope_dn = pair[0]
        entry = pair[1]
        scriptName = entry['jansScr'][0][:-2].decode()
        scriptFile = scripts[scriptName]
        with open(scriptFile, 'rb') as sf:
            entry['jansScr'] = [sf.read()]

        if not db:
            for i, val in enumerate(entry['jansModuleProperty']):
                if b'location_type' in val:
                    entry['jansModuleProperty'][i] = b'{"value1":"location_type","value2":"file","description":""}'

            entry['jansModuleProperty'].append(b'{"value1":"location_path","value2":"' + scriptFile.encode() + b'","description":""}')

        ldif.unparse(scope_dn, entry)
