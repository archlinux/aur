# Maintainer: graysky <graysky AT archlinux dot us>
# Contributor: Chrysalis <mindaxis@gmail.com>

pkgname=mprime-bin
_pkgname=mprime
pkgver=289
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
sha256sums_i686=('75eb6237a41a08276347ec57bcea5e40e2e2af667dbdeec665939f03f1edc4cf')
sha256sums_x86_64=('4f4631df3935397e61d13cbe2ee6b36afd8c402d4b494b6c4bb5df14b45a2a38')

package() {
	install -Dm755 mprime ${pkgdir}/usr/bin/mprime
	install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${_pkgname}/license.txt
	install -Dm644 readme.txt ${pkgdir}/usr/share/doc/${_pkgname}/readme.txt
	install -Dm644 stress.txt ${pkgdir}/usr/share/doc/${_pkgname}/stress.txt
	install -Dm644 undoc.txt ${pkgdir}/usr/share/doc/${_pkgname}/undoc.txt
	install -Dm644 whatsnew.txt ${pkgdir}/usr/share/doc/${_pkgname}/whatsnew.txt
}

# vim:set ts=2 sw=2 et:
