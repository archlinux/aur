# Maintainer: blinry <mail@blinry.org>

pkgname=ethersync-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Enables real-time co-editing of local text files."
arch=('i686' 'x86_64')
url="https://github.com/ethersync/ethersync"
license=('AGPL-3.0-or-later')
source=("$pkgname::$url/releases/download/v$pkgver/ethersync-x86_64-unknown-linux-musl.tar.gz")
sha1sums=('48ed34dd0381b04cc694b44e411267eb1785786b')
options=("strip")
conflicts=("ethersync-git")

package() {
    install -Dm755 "ethersync" "$pkgdir/usr/bin/ethersync"
}
