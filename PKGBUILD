# Maintainer: xihale <xihale.top at qq dot com>
pkgname=cloudpan189-go-mauruppi-bin
pkgver=0.1.5
pkgrel=0
pkgdesc="(MaurUppi-fork) Cloud 189 Command Line Client (CLI), implemented based on GO.(MaurUppi-分支)天翼云盘命令行客户端(CLI),基于GO语言实现"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/MaurUppi/cloudpan189-go"
license=('Apache-2.0')
provides=("${pkgname%-mauruppi-bin}=${pkgver}")
conflicts=(
  "${pkgname%-MaurUppi-bin}"
  "${pkgname%-go-MaurUppi-bin}"
)

source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname%-mauruppi-bin}-v${pkgver}-linux-arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${pkgname%-mauruppi-bin}-v${pkgver}-linux-arm.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${pkgname%-mauruppi-bin}-v${pkgver}-linux-386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-mauruppi-bin}-v${pkgver}-linux-amd64.tar.gz")
source=("${pkgname%-mauruppi-bin}.sh")
sha256sums_aarch64=('2683655ec0f88ede86297204d0b91453552bd3bdd586d82c1fe2ad36f1c5bc62')
sha256sums_armv7h=('3150a57b25ea8f67549a170ff681acd3c736790f290c0346bb174be774a6ab30')
sha256sums_i686=('06e24138b54d7e2adbbec126ea659183d20e3d78a3736ea3f44c9b19e0564e2b')
sha256sums_x86_64=('acf7c9ccf4a1fc87f785cf91a5b3a72888cc88bfe5c819acac80835a71c513db')
sha256sums=('7b43fc93998e2a09b009d79b5e630b391edd32cb7326d71857de4bae631d7f2c')
package() {
  install -Dm755 "${srcdir}/${pkgname%-mauruppi-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-mauruppi-bin}"
  install -Dm755 "${srcdir}/${pkgname%-mauruppi-bin}" "${pkgdir}/usr/bin/${pkgname%-mauruppi-bin}-bin"
}