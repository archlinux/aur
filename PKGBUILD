# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-styles-tenr
pkgver=2015.08.12
pkgrel=1
pkgdesc="Fluxbox style set from tenr.de"
arch=('any')
url="http://tenr.de/styles/"
license=('CCPL')
depends=('')
source=('http://tenr.de/styles/archives/tenr.de-styles-pkg.tar.bz2')
md5sums=('SKIP')

package() {
	mkdir -p ${pkgdir}/usr/share/fluxbox/styles/
	for s in ${srcdir}/tenr.de-styles-pkg/*; do cp -r "$s" "${pkgdir}/usr/share/fluxbox/styles/tenr_$(basename $s)"; done
}
