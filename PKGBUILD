# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=polymc-curseforge
pkgname=multimc-curseforge
pkgver=1.3.1
pkgrel=2
pkgdesc="Adds support for Curseforge's Install button to MultiMC"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=($url/releases/download/$pkgver/linux.tar.gz)
sha512sums=('e93b795284caf25b0e77cacb04c2cce22a037c5ef25a2be733b06d18f6daf9937d8c607a1350d4c2cff8e2e8ba56c2ba2acc59acc42b47c5f857c5d8942d1ee5')
optdepends=('multimc')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
