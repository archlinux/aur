# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=multimc-curseforge
pkgver=1.2.0
pkgrel=2
pkgdesc="Adds support for Curseforge's Install button to MultiMC"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source_i686+=($url/releases/download/$pkgver/linux-386.tar.gz)
source_x86_64+=($url/releases/download/$pkgver/linux-amd64.tar.gz)
sha256sums_i686=('c2d8de748d2650892a60ab100ab83303aeec2d3e3d6998640c9391b6882b1cf9')
sha256sums_x86_64=('b1f9ddc26407bc971972b6be3e7a6b9d088f7eba1fe923bae72adc18f039fa42')
optdepends=('multimc')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
