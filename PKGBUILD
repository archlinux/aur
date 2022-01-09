# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=polymc-curseforge
pkgname=multimc-curseforge
pkgver=1.3.1
pkgrel=1
pkgdesc="Adds support for Curseforge's Install button to MultiMC"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=($url/releases/download/$pkgver/linux.tar.gz)
sha256sums=('718c5101a91c330e8bd3796fb5df969c01714aaf802cf72bdfe2b19b11b26e48')
optdepends=('multimc')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
