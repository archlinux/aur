# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.5.11
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://www.jetpack.io/devbox/"
_githuburl="https://github.com/jetpack-io/devbox"
license=('Apache')
optdepends=('docker' 'nix')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('477160e7fa95daa54ceae9773eb4a2bf74a1a486e838699678873f696de9200b')
sha256sums_armv7h=('477160e7fa95daa54ceae9773eb4a2bf74a1a486e838699678873f696de9200b')
sha256sums_i686=('4854dbcfb7d0a97dc85b695190e127090d51ad8988b7fd8167d4c3837c91820a')
sha256sums_x86_64=('3ab5b299890168703001841ddce2ad78563d805f968c97f38f862163ede5806f')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}