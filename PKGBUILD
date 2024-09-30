# Maintainer: blinry <mail@blinry.org>

pkgname=ethersync-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Enables real-time co-editing of local text files."
arch=('i686' 'x86_64')
url="https://github.com/ethersync/ethersync"
license=('AGPL-3.0-or-later')
source=("$pkgname::$url/releases/download/v$pkgver/ethersync-x86_64-unknown-linux-musl.tar.gz")
sha1sums=('090320fc6333a6e8c6e56feef80080055800ff99')
options=("strip")
conflicts=("ethersync-git")

package() {
    install -Dm755 "ethersync" "$pkgdir/usr/bin/ethersync"
}
