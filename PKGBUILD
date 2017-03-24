# Maintainer: graysky <graysky AT archlinux dot us>
# Contributor: Chrysalis <mindaxis@gmail.com>

pkgname=mprime-bin
_pkgname=mprime
pkgver=291
pkgrel=2
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes. Precompiled binary version."
arch=('i686' 'x86_64')
url="http://www.mersenne.org"
license=('custom')
provides=('mprime')
conflicts=('mprime')
depends=('gcc-libs')
source_x86_64+=("ftp://mersenne.org/gimps/p95v$pkgver.linux64.tar.gz")
source_i686+=("ftp://mersenne.org/gimps/p95v$pkgver.linux32.tar.gz")
sha256sums_i686=('672e248fe1edef036ad4c9f41e84fcf4e52dd4cd58f76a57649d91030b81bc66')
sha256sums_x86_64=('b2260441acdccde13912f31c67a7f7cab540a9573a3f2d6a1d47a34a4f17d196')

package() {
	install -Dm755 mprime ${pkgdir}/usr/bin/mprime
	install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${_pkgname}/license.txt
	install -Dm644 readme.txt ${pkgdir}/usr/share/doc/${_pkgname}/readme.txt
	install -Dm644 stress.txt ${pkgdir}/usr/share/doc/${_pkgname}/stress.txt
	install -Dm644 undoc.txt ${pkgdir}/usr/share/doc/${_pkgname}/undoc.txt
	install -Dm644 whatsnew.txt ${pkgdir}/usr/share/doc/${_pkgname}/whatsnew.txt
}

# vim:set ts=2 sw=2 et:
