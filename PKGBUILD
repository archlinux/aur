# Maintainer: Josh Cass <aur@darkstar.mozmail.com>
pkgname=quarkuscli-bin
pkgver=3.1.0
pkgrel=1
pkgdesc='Create projects, manage extensions and perform build and development tasks for Quarkus, the Kubernetes Native Java stack tailored for OpenJDK HotSpot and GraalVM.'
url='https://github.com/quarkusio/quarkus'
source_x86_64=("https://github.com/quarkusio/quarkus/releases/download/$pkgver.Final/quarkus-cli-$pkgver.Final.tar.gz")
arch=('x86_64')
license=('Apache')
depends=()
optdepends=()
conflicts=()
provides=('quarkus')
sha256sums_x86_64=('528228677ba93c3d57ee60acfd3bee4153bd5d5c939c34a3e315763a21d458e8')

package() {
  cp -R "${srcdir}/quarkus-cli-$pkgver.Final/bin" "${pkgdir}/usr"
  cp -R "${srcdir}/quarkus-cli-$pkgver.Final/lib" "${pkgdir}/usr"
}
