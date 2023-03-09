# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=fq-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Tool, language and decoders for inspecting binary data.'
url='https://github.com/wader/fq'
license=('custom')
arch=('x86_64')
provides=('fq')
source=("fq-$pkgver-$pkgrel.tgz::https://github.com/wader/fq/releases/download/v$pkgver/fq_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4ab194a29f7da6d04d620a3b022a7bbc5f2cdd756a859f15a1443fbc9c774fcf')

package() {
    tar xzf $srcdir/fq-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/fq" "$pkgdir/usr/bin/fq"
}
