# Maintainer: linduxed <linduxed at gmail dot com>

pkgname=exercism-cli
pkgver=v2.2.4
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
license=("MIT")
source=("https://raw.githubusercontent.com/exercism/cli/$pkgver/LICENSE")
md5sums=('f92fe05e2b91655399f2a8b9d24bfe41')
source_i686=("https://github.com/exercism/cli/releases/download/$pkgver/exercism-linux-32bit.tgz")
md5sums_i686=('b23315eee0e2af27ca0138ddc53e642c')
source_x86_64=("https://github.com/exercism/cli/releases/download/$pkgver/exercism-linux-64bit.tgz")
md5sums_x86_64=('c88b082172b655b156ca35743f453e24')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
