# Maintainer: Finn Hering <finn at hering dot sh>
pkgname=eis-bin
_pkgname=eis
pkgver="1.0.0"
pkgrel=1
pkgdesc="eis is a simple to use command line interface which allows you to use Christian R.'s elearning platform."
arch=('x86_64')
url="https://vccourses.cs.ovgu.de/bjoern.gehrke/eis"
license=('MIT')
provides=(eis)
source=("https://vccourses.cs.ovgu.de/bjoern.gehrke/eis/uploads/2fc2b874d2def4b49469cfa8e28bd9e7/eis")
noextract=('eis')

sha256sums=('02f53e9a81eedfb678fd7e8421263b02c1bf1dfd38fa28ebeea54535ef5a67aa')

package() {
    install -Dm755 "eis" "${pkgdir}/usr/bin/${_pkgname}"
}
