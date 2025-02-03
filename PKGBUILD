# Maintainer: Maykel Moya <mmoya [at] mmoya [dot] org>

_pkgver=0.0.1-pre-alpha-2
pkgname=robrix-bin
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Matrix chat client written using Makepad + Robius app dev framework in Rust."
arch=('x86_64')
url="https://github.com/project-robius/robrix"
options=(!lto)
source=("https://github.com/project-robius/robrix/releases/download/v${_pkgver}/robrix-${_pkgver#*-}-x86_64.tar.gz")
sha512sums=("a8d24e2f699c227cf189f784c50afc40f59d527ec6b174b0875f3860207ae7989f6ee5983e7ac07954a04a35066f6494611ae71abea1384530828946ca6f4d20")
package() {
    cp -r ${srcdir}/* ${pkgdir}/
}
