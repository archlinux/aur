# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide-release
pkgver=0.18.3
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-linux-amd64.tar.gz")
sha256sums=('96f5e97daf76848c391e6c9d822c7c260f341d12dd95281f86c8212bbeadf08b')

options=('!strip' '!debug')

package() {
    install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
