# Maintainer: graysky <graysky AT archlinux dot us>
# Contributor: Chrysalis <mindaxis@gmail.com>

pkgname=mprime-bin
_pkgname=mprime
pkgver=287
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes. Precompiled binary version."
arch=('i686' 'x86_64')
url="http://www.mersenne.org"
license=('custom')
provides=('mprime')
conflicts=('mprime')
depends=('gcc-libs')
source_x86_64+=("ftp://mersenne.org/gimps/p95v$pkgver.linux64.tar.gz")
source_i686+=("ftp://mersenne.org/gimps/p95v$pkgver.linux32.tar.gz")
sha256sums_i686=('836ad76a17762dca50c2bed55c9e46655268e42b0de1c87e2499e92602e41435')
sha256sums_x86_64=('3555426f170ae222de34599aca8dac9c621923a3e7d492d25138c086f45536ab')

package() {
	install -Dm755 mprime ${pkgdir}/usr/bin/mprime
	install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${_pkgname}/license.txt
	install -Dm644 readme.txt ${pkgdir}/usr/share/doc/${_pkgname}/readme.txt
	install -Dm644 stress.txt ${pkgdir}/usr/share/doc/${_pkgname}/stress.txt
	install -Dm644 undoc.txt ${pkgdir}/usr/share/doc/${_pkgname}/undoc.txt
	install -Dm644 whatsnew.txt ${pkgdir}/usr/share/doc/${_pkgname}/whatsnew.txt
}

# vim:set ts=2 sw=2 et:
