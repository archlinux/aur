# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: Chrysalis <mindaxis@gmail.com>

pkgname=mprime-bin
_pkgname=mprime
pkgver=30.19.13
_pkgver=3019b13
epoch=1
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes. Precompiled binary version."
arch=('x86_64')
url="http://www.mersenne.org"
license=('custom')
provides=('mprime')
conflicts=('mprime')
depends=('gcc-libs')
source=("https://www.mersenne.org/download/software/v${pkgver%%.*}/${pkgver%.*}/p95v${_pkgver}.linux64.tar.gz")
b2sums=('add84251cb432f092360d6f7855c6cef3f6570a9f37b14837e435363899a5395ed913b8feb1142ca47446d03a772dffc5086a7f67d8b7b50d1d9c962b4a33e59')

package() {
	install -Dm755 mprime ${pkgdir}/usr/bin/mprime
	install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${_pkgname}/license.txt
	install -Dm644 readme.txt ${pkgdir}/usr/share/doc/${_pkgname}/readme.txt
	install -Dm644 stress.txt ${pkgdir}/usr/share/doc/${_pkgname}/stress.txt
	install -Dm644 undoc.txt ${pkgdir}/usr/share/doc/${_pkgname}/undoc.txt
	install -Dm644 whatsnew.txt ${pkgdir}/usr/share/doc/${_pkgname}/whatsnew.txt
}

# vim:set ts=2 sw=2 et:
