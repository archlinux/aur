# Maintainer: Mikkel Kappel Persson <mikkel@kappelpersson.dk>
pkgname=huebox
pkgver=0.5.3
pkgrel=1
pkgdesc='Terminal theme editor with live preview'
arch=('x86_64' 'aarch64')
url='https://github.com/MikkelKappelPersson/huebox'
license=('MIT')
depends=('gcc-libs')
source_x86_64=("huebox-$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/huebox-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("huebox-$pkgver-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/huebox-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('086e4e0b5249f63db38566f8ce76f619a14da9b4136f993ce86cec8f62834a62')
sha256sums_aarch64=('3401217e94ba642fb3f925cc874d45b16a5991fed6f4d3ff0eb288ebeb3fe597')

package() {
  install -Dm755 huebox "$pkgdir/usr/bin/huebox"
}
