# Maintainer Storm Dragon <stormdragon2976@gmail.com>
# Contributer: Matthew Brunelle <ciferkey@gmail.com>
# Contributor: Kyla McDonald <kyla.r.mcdonald@gmail.com>
# Contributor: Chris Down <cdown.uk@gmail.com>
# Contributor: Alexander Straube <alexander.straube@googlemail.com>

pkgname=gmabooster
pkgver=09c
pkgrel=4
pkgdesc="Tool to (over)clock Intel 945GM/GME/GMS/GSE, 943/940GML/GU, and GMA 950."
arch=(i686)
url="http://www.gmabooster.com/"
license=('donationware')
source=('https://github.com/ciferkey/GMABooster_Linux/raw/master/GMABooster_Linux_09c.zip'
        'gmabooster.sh')
md5sums=('1b5476298f531a538af746671dc51b7a'
         'a8e4fbfb1299139aa9a7f14047bc8be5')

package() {
	install -D -c -m755 ${srcdir}/GMABooster             ${pkgdir}/opt/GMABooster/GMABooster || return 1
	install -D -c -m755 ${srcdir}/data.bin               ${pkgdir}/opt/GMABooster/data.bin || return 2
	install -D -c -m755 ${srcdir}/Readme_GMABooster.txt  ${pkgdir}/opt/GMABooster/Readme_GMABooster.txt || return 3
	install -D -c -m755 ${srcdir}/gmabooster.sh          ${pkgdir}/usr/bin/gmabooster || return 4
}
