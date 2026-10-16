# Maintainer: Mikkel Kappel Persson <mikkel@kappelpersson.dk>
pkgname=huebox
pkgver=0.5.4
pkgrel=1
pkgdesc='Terminal theme editor with live preview'
arch=('x86_64' 'aarch64')
url='https://github.com/MikkelKappelPersson/huebox'
license=('MIT')
depends=('gcc-libs')
source_x86_64=("huebox-$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/huebox-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("huebox-$pkgver-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/huebox-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('8c492a08ae4ea7eb4857408c4f8b39f2823f2f12fe500a7122c60693e47e614f')
sha256sums_aarch64=('b52a690ee61c0025454c32fa1201fd8c2824e38808469a7830132f8c995d065e')

package() {
  install -Dm755 huebox "$pkgdir/usr/bin/huebox"
}
