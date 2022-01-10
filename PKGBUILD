# Maintainer: Finn Hering <finn at hering dot sh>
pkgname=eis-bin
_pkgname=eis
pkgver="1.0.0"
pkgrel=4
pkgdesc="eis is a simple to use command line interface which allows you to use Christian R.'s elearning platform."
arch=('x86_64')
url="https://vccourses.cs.ovgu.de/bjoern.gehrke/eis"
license=('MIT')
provides=(eis)
source=("$pkgname-$pkgver-$pkgrel::https://git.hering.sh/finn/eis/-/jobs/487/artifacts/raw/bin/eis")
noextract=('eis')
sha256sums=('0c531b6e30bc375249fb8c0e2d76909283f77d886eb60a47298d7d8fe7cd2ddf')

package() {
    install -Dm755 "$pkgname-$pkgver-$pkgrel" "${pkgdir}/usr/bin/${_pkgname}"
}
