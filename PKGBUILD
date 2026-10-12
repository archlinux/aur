# Maintainer: Mikkel Kappel Persson <mikkel@kappelpersson.dk>
pkgname=huebox
pkgver=0.5.1
pkgrel=1
pkgdesc='Terminal theme editor with live preview'
arch=('x86_64')
url='https://github.com/MikkelKappelPersson/huebox'
license=('MIT')
depends=('gcc-libs')
source=("huebox-$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/huebox-$pkgver-x86_64-linux.tar.gz")
sha256sums=('29a1a0b20b80b1723b7ee71f446afe8cd591060e908ba9fdd80b1593408b33ea')

package() {
  install -Dm755 huebox "$pkgdir/usr/bin/huebox"
}
