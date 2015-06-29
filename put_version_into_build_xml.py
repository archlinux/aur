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
            ['git', 'describe', '--long', '--tags'])
    except subprocess.CalledProcessError:
        print('Call to git failed. Skipping...', file=sys.stderr)
        return

    mobj = re.match(
        r'''(?x)
            version
            (?P<major>\d)\.
            (?P<minor>\d)\.
            (?P<release>\d)-
            (?P<build>\d+)-.*''',
        git_version.decode('utf-8'))

    if not mobj:
        print('unexpected git version %s. Skipping...' % git_version)
        return

    versions = {
        'major': mobj.group('major'),
        'minor': mobj.group('minor'),
        'release': mobj.group('release'),
        'build': mobj.group('build'),
    }

    print('Set version to %s.%s.%s' % (
        versions['major'], versions['minor'], versions['release']))

    for version_type in versions.keys():
        path = './target/property[@name="version.%s"]' % version_type
        for element in tree.findall(path):
            element.set('value', str(versions[version_type]))

    tree.write(build_xml_filename, encoding='UTF-8', xml_declaration=True)

if __name__ == '__main__':
    main()
