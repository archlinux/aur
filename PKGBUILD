# Maintainer: tdiant <i@tdiant.net>
# Contributor: Josh Cass <archlinux.okyuf@passmail.net>
pkgname=quarkuscli-bin
pkgver=3.16.1
checksum=df4d97b99a7818e647184adac863372238cdc9431e3a9e80a2353846d7fc539f
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
sha256sums_x86_64=("$checksum")

package() {
  install -Dm0755 "${srcdir}/quarkus-cli-$pkgver/bin/quarkus" "${pkgdir}/usr/bin/quarkus"
  install -Dm0644 "${srcdir}/quarkus-cli-$pkgver/bin/quarkus.bat" "${pkgdir}/usr/bin/quarkus.bat"
  install -Dm0644 "${srcdir}/quarkus-cli-$pkgver/lib/quarkus-cli-$pkgver-runner.jar" "${pkgdir}/usr/lib/quarkus-cli-$pkgver-runner.jar"
}
