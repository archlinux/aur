# Maintainer: Finn Hering <finn at hering dot sh>
pkgname=eis-bin
_pkgname=eis
pkgver="1.0.0"
pkgrel=2
pkgdesc="eis is a simple to use command line interface which allows you to use Christian R.'s elearning platform."
arch=('x86_64')
url="https://vccourses.cs.ovgu.de/bjoern.gehrke/eis"
license=('MIT')
provides=(eis)
source=("https://git.hering.sh/finn/eis/-/jobs/487/artifacts/raw/bin/eis")
noextract=('eis')
sha256sums=('7469d725d56d3b5ce82dc4a628e17d285f5fdb66c5bb34e4a41ca6b7fef36eee')

package() {
    install -Dm755 "eis" "${pkgdir}/usr/bin/${_pkgname}"
}
