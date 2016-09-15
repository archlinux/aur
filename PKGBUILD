# Maintainer: linduxed <linduxed at gmail dot com>

pkgname=exercism-cli
pkgver=v2.3.0
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
license=("MIT")
source=("https://raw.githubusercontent.com/exercism/cli/$pkgver/LICENSE")
md5sums=('f92fe05e2b91655399f2a8b9d24bfe41')
source_i686=(exercism-linux-32bit-$pkgver.tgz::"https://github.com/exercism/cli/releases/download/$pkgver/exercism-linux-32bit.tgz")
md5sums_i686=('d4d64955db514847640503fc8217a602')
source_x86_64=(exercism-linux-64bit-$pkgver.tgz::"https://github.com/exercism/cli/releases/download/$pkgver/exercism-linux-64bit.tgz")
md5sums_x86_64=('6dd3e655971c84d48046fe2f7e80ec22')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
