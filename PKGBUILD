# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=battery
pkgver=0.1.23
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
sha256sums_x86=("1aa854a588954418e4cf72d0691f3115f8649f963f96aa348e9d23c6dc2a62e5")
sha256sums_x86_64=("360af0792913a32ab62fa24df7bbdbf2b208e485d47a5b969c34d4b5da9f317c")
sha256sums_armv7h=("12239a8b7cb60ccf802919e3f760ab0c282b33240edde34cff38b3e029c4703b")
sha256sums_aarch64=("ae2889fa0a05790a11229d911125e2696b6627e6518253314a43d4bfd9bb5960")


package() {
  install -Dm755 "${srcdir}/battery" "${pkgdir}/usr/bin/battery"
  install -Dm644 "${srcdir}/LICENSE_1_0.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}