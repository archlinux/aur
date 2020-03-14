import os
import re
import subprocess
import sys
import xml.etree.ElementTree as ET


def main():
    build_xml_filename = 'build.xml'
    if not os.access(build_xml_filename, os.R_OK | os.W_OK):
        print(
            '%s not found. Skipping' % build_xml_filename,
            file=sys.stderr)
        return

    tree = ET.parse(build_xml_filename)

    try:
        git_version = subprocess.check_output(
            ['git', 'describe', '--long', '--tags', '--match', 'version*'])
    except subprocess.CalledProcessError:
        print('Call to git failed. Skipping...', file=sys.stderr)
        return

    mobj = re.match(
        r'''(?x)
            version
            (?P<version>[^-]+)-
            (?P<revcount>\d+)-
            g(?P<hash>[0-9a-f]+)''',
        git_version.decode('utf-8'))

    if not mobj:
        print('unexpected git version %s. Skipping...' % git_version)
        return

    versions = {
        'version': mobj.group('version'),
        'revcount': mobj.group('revcount'),
        'hash': mobj.group('hash'),
    }

    print('Set version to %s.r%s (commit %s)' % (
        versions['version'], versions['revcount'], versions['hash']))

    for version_key, value in zip(['major', 'minor', 'release', 'build'], versions['version'].split('.')):
        path = './target/property[@name="version.%s"]' % version_key
        for element in tree.findall(path):
            element.set('value', value)

    tree.write(build_xml_filename, encoding='UTF-8', xml_declaration=True)

if __name__ == '__main__':
    main()
