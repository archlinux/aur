# Maintainer: Elrondo46 <elrond94athotmaildotcom>

pkgname=wps-office-lang-fr-git
pkgver=20160201
pkgrel=1
pkgdesc="WPS Office lang fr"
arch=('any')
url="https://github.com/Elrondo46/wps-fr-precompiled.git"
license=('GPL3')
depends=('wps-office' 'git' 'ttf-wps-fonts')
source=("git://github.com/Elrondo46/wps-fr-precompiled.git")
sha256sums=('SKIP')

package() {
 mkdir -p "$pkgdir"/usr/lib/office6/mui 
 cp -R "$srcdir"/wps-fr-precompiled/fr_FR "$pkgdir"/usr/lib/office6/mui
}

