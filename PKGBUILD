# Maintainer: Alex Gu <gualse.mail@yandex.com>
pkgname=mycorrhiza-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Filesystem and git-based wiki engine written in Go using mycomarkup."
arch=('x86_64' 'i686')
url="https://github.com/bouncepaw/mycorrhiza"
license=('AGPL3')
depends=('git')
provides=('mycorrhiza')
conflicts=('mycorrhiza')
source_x86_64=("$pkgname-$pkgver.tar.gz::\
https://github.com/bouncepaw/mycorrhiza/releases/download/v$pkgver/mycorrhiza-v$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::\
https://github.com/bouncepaw/mycorrhiza/releases/download/v$pkgver/mycorrhiza-v$pkgver-linux-868.tar.gz")
md5sums_x86_64=('2eaa47c9da986512cc7617b8cb300536')
md5sums_i686=('42124e6e861d5f9b3e093b4893f86c59')

package() {
  install -Dm755 "mycorrhiza" "$pkgdir/usr/bin/mycorrhiza"
}
