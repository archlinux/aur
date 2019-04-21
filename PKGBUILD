# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=battery
pkgver=0.1.20
pkgrel=1
pkgdesc="Build System and Package Manager for the Volt Programming Language"
arch=("x86" "x86_64")
license=("BSL")

source=("https://www.boost.org/LICENSE_1_0.txt")
source_x86=("https://github.com/VoltLang/Battery/releases/download/v${pkgver}/battery-${pkgver}-x86-linux.tar.gz")
source_x86_64=("https://github.com/VoltLang/Battery/releases/download/v${pkgver}/battery-${pkgver}-x86_64-linux.tar.gz")

sha256sums=("c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566")
sha256sums_x86=("160f292fe35416fe037b3d3d9e0460cb2f1ac9c1347e2a7c3c08ea281a759d2f")
sha256sums_x86_64=("7775ac99b6db2448e9f0757476ff826722746ab707dc2f34d500408253b9dbf0")

package() {
  install -Dm755 "${srcdir}/battery" "${pkgdir}/usr/bin/battery"
  install -Dm644 "${srcdir}/LICENSE_1_0.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}