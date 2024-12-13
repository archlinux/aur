# Maintainer: blinry <mail@blinry.org>

pkgname=ethersync-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Enables real-time co-editing of local text files."
arch=('i686' 'x86_64')
url="https://github.com/ethersync/ethersync"
license=('AGPL-3.0-or-later')
source=("$pkgname::$url/releases/download/v$pkgver/ethersync-x86_64-unknown-linux-musl.tar.gz")
options=("strip")
conflicts=("ethersync-git")
sha1sums=('b29efc785b7b057f6a61889f3cb3d0db7630bb40')

package() {
    install -Dm755 "ethersync" "$pkgdir/usr/bin/ethersync"
}
