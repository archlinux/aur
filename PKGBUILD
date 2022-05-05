# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: Chrysalis <mindaxis@gmail.com>

pkgname=mprime-bin
_pkgname=mprime
pkgver=307b9
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes. Precompiled binary version."
arch=('x86_64')
url="http://www.mersenne.org"
license=('custom')
provides=('mprime')
conflicts=('mprime')
depends=('gcc-libs')
source=("ftp://mersenne.org/gimps/p95v$pkgver.linux64.tar.gz")
b2sums=('8ebae083d26309f7c624e38c943e3bb0c7fe40a538840970dc222ed33ba5eaa9a5c0767b822682921eaae27f839c1eca5c0204b2c135748002e5d072744afe25')

package() {
	install -Dm755 mprime ${pkgdir}/usr/bin/mprime
	install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${_pkgname}/license.txt
	install -Dm644 readme.txt ${pkgdir}/usr/share/doc/${_pkgname}/readme.txt
	install -Dm644 stress.txt ${pkgdir}/usr/share/doc/${_pkgname}/stress.txt
	install -Dm644 undoc.txt ${pkgdir}/usr/share/doc/${_pkgname}/undoc.txt
	install -Dm644 whatsnew.txt ${pkgdir}/usr/share/doc/${_pkgname}/whatsnew.txt
}

# vim:set ts=2 sw=2 et:
