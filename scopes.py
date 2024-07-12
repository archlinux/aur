#!/usr/bin/env python

import sys
import os
import json
import yaml
from glob import glob
from ldif import LDIFWriter, LDIFRecordList

def exitWithUsage():
    print(f"Usage:")
    print(f"  {sys.argv[0]} create <config-api-rs-protect.json> <jans-config-api-swagger.yaml>")
    print(f"  {sys.argv[0]} roles <config-api-rs-protect.json> <role-scope-mappings.json>")
    print(f"  {sys.argv[0]} update <config-api-rs-protect.json> <testing-clients.ldif>")
    exit(-1)

# Based on jans/docker-jans-persistence-loader/scripts/utils.py
def get_config_api_scopes(path):
    scopes = {}

    with open(path) as f:
        scope_defs = json.loads(f.read())

    for resource in scope_defs["resources"]:
        for condition in resource["conditions"]:
            for scope in condition["scopes"]:
                if scope.get("inum") and scope.get("name"):
                    scopes[scope.get("inum")] = scope.get("name")

    return scopes

# Same
def get_role_scope_mappings(mappingFile, scopes):
    with open(mappingFile) as f:
        role_mapping = json.loads(f.read())

    for i, api_role in enumerate(role_mapping["rolePermissionMapping"]):
        if api_role["role"] != "api-admin":
            role_mapping["rolePermissionMapping"][i]["permissions"].sort()
            continue

        # add special permissions for api-admin
        for scope in scopes.values():
            if scope in role_mapping["rolePermissionMapping"][i]["permissions"]:
                continue
            role_mapping["rolePermissionMapping"][i]["permissions"].append(scope)
        role_mapping["rolePermissionMapping"][i]["permissions"].sort()

    # finalized role mapping
    return role_mapping

def get_scope_descriptions(swaggerPath):
    descriptions = {}
    for file in glob(swaggerPath + '/**/*-swagger.yaml', recursive=True):
        with open(file) as yf:
            ref = yaml.safe_load(yf)
            descriptions.update(ref['components']['securitySchemes']['oauth2']['flows']['clientCredentials']['scopes'])

    return descriptions

if len(sys.argv) != 4:
    exitWithUsage()

action = sys.argv[1]
scopeFile = sys.argv[2]
secondParam = sys.argv[3]

scope_type = 'oauth'
scope_levels = {'scopes':'1', 'groupScopes':'2', 'superScopes':'3'}

scopes = get_config_api_scopes(scopeFile)
ldif = LDIFWriter(sys.stdout, cols=1000)

if action == 'roles':
    mapping = get_role_scope_mappings(secondParam, scopes)
    print(json.dumps(mapping, indent=2))
elif action == 'create':
    descriptions = get_scope_descriptions(secondParam)

    for scopeInum in sorted(scopes.keys()):
        scope_dn = 'inum={},ou=scopes,o=jans'.format(scopeInum)
        scope = scopes[scopeInum]
        display_name = 'Config API scope {}'.format(scope)

        if scope in descriptions:
            description = descriptions[scope]
        else:
            description = 'Config API scope {}'.format(scope)

        entry = {
            'objectClass': ['top', 'jansScope'],
            'description': [description],
            'displayName': [display_name],
            'inum': [scopeInum],
            'jansDefScope': ['false'],
            'jansId': [scope],
            'jansScopeTyp': [scope_type],
            'jansAttrs': [json.dumps({"spontaneousClientId":None, "spontaneousClientScopes":[], "showInConfigurationEndpoint": False})],
        }

        entry = {name: [e.encode('utf8') for e in val] for name, val in entry.items()}
        ldif.unparse(scope_dn, entry)
elif action == 'update':
    with open(secondParam) as lf:
        ldifrecords = LDIFRecordList(lf)
        ldifrecords.parse_entry_records()
        for pair in ldifrecords.all_records:
            scope_dn = pair[0]
            entry = pair[1]
            dn = ','.join(entry['jansScope'][0].decode().split(',')[1:])
            entry['jansScope'] += [('inum=' + scope + ',' + dn).encode('utf8') for scope in sorted(scopes.keys(), key=lambda s: '.'.join(t.rjust(5) for t in s.split('.')))]
            ldif.unparse(scope_dn, entry)

else:
    exitWithUsage()

