#!/usr/bin/env python3
"""
Create Arch-style `depends()` entries from Debian-style `Depends: ` line

Usage: Paste in the line starting with "Depends: " (without the "Depends: " part)
"""

exceptions={
    'libcgi-pm-perl': 'perl-cgi',
    'libdbd-sqlite3-perl': 'perl-dbd-sqlite',
    'libgraphics-magick-perl': 'graphicsmagick',
    'libhtml-format-perl': 'perl-html-formatter',
    'libintl-perl': 'perl-libintl-perl',
    'libnet-ldap-perl' : 'perl-ldap',
    'libtemplate-perl': 'perl-template-toolkit',
    'libwww-perl': 'perl-libwww',
    'starman': 'perl-starman'
}

def to_arch_pkg_name(deb_name):
    try:
        return exceptions[deb_name]
    except KeyError:
        if deb_name[:3]=='lib' and deb_name[-5:]=='-perl':
            return 'perl-'+deb_name[3:-5]
        return None

def parse_depends(lnDeps):
    deps=lnDeps.split(', ')
    apkgs=[]
    for dep in deps:
        if '|' in dep or '(' in dep:
            print('Warning: Not a simple expression: "{}"'.format(dep))
            dep=dep.split('|')[0].split('(')[0].strip()
        apkg=to_arch_pkg_name(dep)
        if apkg is None:
            print('ERROR: Not a Perl dependency: "{}"'.format(dep))
            continue
        apkgs.append(apkg)
    return apkgs

print("'"+"' '".join(parse_depends(input()))+"'")
