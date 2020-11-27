# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=battery
pkgver=0.1.24
pkgrel=1
pkgdesc="Build System and Package Manager for the Volt Programming Language"
arch=("x86" "x86_64" "aarch64" "armv7h")
license=("BSL")

source=("https://www.boost.org/LICENSE_1_0.txt")
source_x86=("https://github.com/VoltLang/Battery/releases/download/v${pkgver}/battery-${pkgver}-x86-linux.tar.gz")
source_x86_64=("https://github.com/VoltLang/Battery/releases/download/v${pkgver}/battery-${pkgver}-x86_64-linux.tar.gz")
source_armv7h=("https://github.com/VoltLang/Battery/releases/download/v${pkgver}/battery-${pkgver}-armhf-linux.tar.gz")
source_aarch64=("https://github.com/VoltLang/Battery/releases/download/v${pkgver}/battery-${pkgver}-aarch64-linux.tar.gz")

sha256sums=("c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566")
sha256sums_x86=("fca418e66e70a62850462a455fc06e9d540074d6d550ea17fd4d90469ec67208")
sha256sums_x86_64=("15350d15210a43c3f0353dae58c6c0bc6d40c2138dbcb5d48b7ad64c884f5a7e")
sha256sums_armv7h=("bc47f4be8925c3c32ed78f51a43a26adefa068ed98caf5c629ce442644666e78")
sha256sums_aarch64=("36fd1648eddc94c68c86cd8cf8d3845e46e566b517378959a8078e185c5ea6cd")


package() {
  install -Dm755 "${srcdir}/battery" "${pkgdir}/usr/bin/battery"
  install -Dm644 "${srcdir}/LICENSE_1_0.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}