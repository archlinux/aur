# Maintainer: Mikkel Kappel Persson <mikkel@kappelpersson.dk>
pkgname=huebox
pkgver=0.5.2
pkgrel=1
pkgdesc='Terminal theme editor with live preview'
arch=('x86_64' 'aarch64')
url='https://github.com/MikkelKappelPersson/huebox'
license=('MIT')
depends=('gcc-libs')
source_x86_64=("huebox-$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/huebox-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("huebox-$pkgver-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/huebox-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('9b6a8439f0f5d48a55d8a7d0d2c7caa4fb686af47e677325e91c9867ac9acbb4')
sha256sums_aarch64=('73612d0bb756326ec5b6abacbf8ea3b42ab1b928cd17d5850bc859a74d29cdcb')

package() {
  install -Dm755 huebox "$pkgdir/usr/bin/huebox"
}
