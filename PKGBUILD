# Maintainer: Gaetan Bisson <bisson@archlinux.org>

_pkgname=seadata
pkgname=pari-${_pkgname}
pkgver=20150112
pkgrel=1
pkgdesc='pari package needed by ellap for large primes'
url='http://pari.math.u-bordeaux.fr/packages.html'
license=('GPL')
arch=('any')
depends=('pari')
source=("http://pari.math.u-bordeaux.fr/pub/pari/packages/${_pkgname}.tgz")
sha1sums=('fa3deb36df0ce71a466eb0ff0d4a18d48d44e8b9')

conflicts=('pari-seadata-small')
provides=('pari-seadata-small')

package() {
	cd "${pkgdir}"
	install -d usr/share/pari
	cp -r "${srcdir}/data/${_pkgname}" usr/share/pari
}
