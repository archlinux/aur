# Maintainer: blinry <mail@blinry.org>

pkgname=ethersync-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Enables real-time co-editing of local text files."
arch=('i686' 'x86_64')
url="https://github.com/ethersync/ethersync"
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/ethersync-x86_64-unknown-linux-musl.tar.gz")
options=("strip")
conflicts=("ethersync-git")
sha1sums=('0a88f68597b93da8d0e07cc05b547adaec3a40d9')

package() {
    install -Dm755 "ethersync" "$pkgdir/usr/bin/ethersync"
}
