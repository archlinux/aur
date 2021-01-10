# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=multimc-curseforge
pkgver=1.2.1
pkgrel=1
pkgdesc="Adds support for Curseforge's Install button to MultiMC"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source_i686+=($url/releases/download/$pkgver/linux-386.tar.gz)
source_x86_64+=($url/releases/download/$pkgver/linux-amd64.tar.gz)
sha256sums_i686=('333bb46a0accfdfa70f9572b98f1951991ee52982b95e2b8af8a2a9683132a1d')
sha256sums_x86_64=('8bbade41e550c62d3d549d12669291eac67adfc5c015af8665cb87a633c0c6d7')
optdepends=('multimc')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
