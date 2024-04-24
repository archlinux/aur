# Maintainer: Josh Cass <archlinux.okyuf@passmail.net>
pkgname=quarkuscli-bin
pkgver=3.9.4
pkgrel=1
pkgdesc='Create projects, manage extensions and perform build and development tasks for Quarkus, the Kubernetes Native Java stack tailored for OpenJDK HotSpot and GraalVM.'
url='https://github.com/quarkusio/quarkus'
source_x86_64=("https://github.com/quarkusio/quarkus/releases/download/$pkgver/quarkus-cli-$pkgver.tar.gz")
arch=('x86_64')
license=('Apache')
depends=('java-runtime')
optdepends=()
conflicts=()
provides=('quarkus')
sha256sums_x86_64=('7b3e03f9ccd80e1b3f18dae3445f01c7df7d2515b412280cc5cdfd7ce1f9e15f')

package() {
  install -Dm0755 "${srcdir}/quarkus-cli-$pkgver/bin/quarkus" "${pkgdir}/usr/bin/quarkus"
  install -Dm0644 "${srcdir}/quarkus-cli-$pkgver/bin/quarkus.bat" "${pkgdir}/usr/bin/quarkus.bat"
  install -Dm0644 "${srcdir}/quarkus-cli-$pkgver/lib/quarkus-cli-$pkgver-runner.jar" "${pkgdir}/usr/lib/quarkus-cli-$pkgver-runner.jar"
}
