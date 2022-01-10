# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=polymc-curseforge
pkgver=1.4.1
pkgrel=2
pkgdesc="Adds support for Curseforge's Install button to PolyMC"
arch=('i686' 'x86_64')
url="https://github.com/ShayBox/$pkgname"
license=('MIT')
source=($url/releases/download/$pkgver/linux.tar.gz)
sha512sums=('610278a21bec79ff892329803918e356deae87fbdea5209f18fa7d9bd74ce364ee15a447b02e410f77925c1e6b9aa9113ee78506df2888eff706c18662bbd205')
optdepends=('polymc')

package() {
  install -Dm755 usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 usr/share/applications/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
