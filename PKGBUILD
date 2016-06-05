# Maintainer: linduxed <linduxed at gmail dot com>

pkgname=exercism-cli
pkgver=v2.2.6
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
license=("MIT")
source=("https://raw.githubusercontent.com/exercism/cli/$pkgver/LICENSE")
md5sums=('f92fe05e2b91655399f2a8b9d24bfe41')
source_i686=("https://github.com/exercism/cli/releases/download/$pkgver/exercism-linux-32bit.tgz")
md5sums_i686=('b7418694a33fe2e274b97e861d80da44')
source_x86_64=("https://github.com/exercism/cli/releases/download/$pkgver/exercism-linux-64bit.tgz")
md5sums_x86_64=('ad36d1f50dd5ed669b26dca5b8b24d45')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
