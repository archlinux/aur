# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=multimc-curseforge
pkgver=1.2.0
pkgrel=1
pkgdesc="Adds support for Curseforge's Install button to MultiMC"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source_i686+=($url/releases/download/$pkgver/linux-386.tar.gz)
source_x86_64+=($url/releases/download/$pkgver/linux-amd64.tar.gz)
sha256sums_i686=('acacf48f6220d895e20518908b854e578ad0def4e796e401ab7c6851b1493568')
sha256sums_x86_64=('ae21e6a7858b57565bca50502797e1cf0476ef442fc552206767fea83e490172')
optdepends=('multimc')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
