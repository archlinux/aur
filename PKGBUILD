# Maintainer: Alex Gu <gualse.mail@yandex.com>
pkgname=mycorrhiza-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Filesystem and git-based wiki engine written in Go using mycomarkup."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/bouncepaw/mycorrhiza"
license=('AGPL3')
depends=('git')
provides=('mycorrhiza')
conflicts=('mycorrhiza')
source_x86_64=("$pkgname-$pkgver.tar.gz::\
https://github.com/bouncepaw/mycorrhiza/releases/download/v$pkgver/mycorrhiza-v$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::\
https://github.com/bouncepaw/mycorrhiza/releases/download/v$pkgver/mycorrhiza-v$pkgver-linux-868.tar.gz")
source_arm64=("$pkgname-$pkgver.tar.gz::\
https://github.com/bouncepaw/mycorrhiza/releases/download/v$pkgver/mycorrhiza-v$pkgver-linux-arm64.tar.gz")
md5sums_x86_64=('c8e41aa290f5a7e851f8d1ecb0c194d2')
md5sums_i686=('ad6e63161dbe9e54ae8c7aae3740eedc')
md5sums_arm64=('5a51d95c70e31ed65e51f7f40508fc85')

package() {
  install -Dm755 "mycorrhiza" "$pkgdir/usr/bin/mycorrhiza"
}
