# Maintainer: port19 <port19 at port19 dot xyz>
pkgname='roc-nightly-bin'
_name='roc_nightly-linux_x86_64-2023-05-17-d6dfdab'
pkgver=0.0
pkgrel=1
pkgdesc='A fast, friendly, functional language. Work in progress!'
arch=('x86_64')
url='https://github.com/roc-lang/roc'
license=('UPL1.0')
source=("https://github.com/roc-lang/roc/releases/download/nightly/$_name.tar.gz")
md5sums=('SKIP')
package() {
    tar -xf $_name.tar.gz
    install -Dm755 "$_name/roc" "$pkgdir/usr/bin/roc"
}
