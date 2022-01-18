# Maintainer: Finn Hering <finn at hering dot sh>
pkgname=eis-bin
_pkgname=eis
pkgver="1.0.1"
pkgrel=4
pkgdesc="Eis is a simple to use command line interface which allows you to use Christian R.'s elearning platform. This package is a forked version of eis which includes some fixes"
arch=('x86_64')
url="https://git.hering.sh/finn/eis"
license=('MIT')
provides=(eis)
source=("$pkgname-$pkgver-$pkgrel::https://git.hering.sh/finn/eis/-/jobs/496/artifacts/raw/bin/eis")
noextract=('eis')
sha256sums=('d045fe2120cdf8ac0c411a95252b36a2f1d67b74537733622ed3be900d10d5f9')

package() {
    install -Dm755 "$pkgname-$pkgver-$pkgrel" "${pkgdir}/usr/bin/${_pkgname}"
}
