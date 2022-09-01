# Maintainer: Rvn0xsy <rvn0xsy@gmail.com>
# Contributor: Rvn0xsy <rvn0xsy@gmail.com>
pkgname="red-tldr"
pkgver="0.4.3"
pkgrel="1"
pkgdesc="red-tldr is a lightweight text search tool, which is used to help red team staff quickly find the commands and key points they want to execute, so it is more suitable for use by red team personnel with certain experience."
arch=("x86_64")
license=("custom")
url='https://github.com/Rvn0xsy/red-tldr'

source=("https://github.com/Rvn0xsy/red-tldr/releases/download/v${pkgver}/red-tldr_${pkgver}_linux_amd64.tar.gz")
sha512sums=("aa4ce44d2e8a84d1e0bf390cb5ed28e40458645313a5a48ec24d07ecf494928694eb60452c91b03df33f6abe6e604d1be37b8b42069ebb2703e0dedd63845c32")

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}