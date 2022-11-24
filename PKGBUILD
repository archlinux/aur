# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=fq-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Tool, language and decoders for inspecting binary data.'
url='https://github.com/wader/fq'
license=('custom')
arch=('x86_64')
provides=('fq')
source=("fq-$pkgver-$pkgrel.tgz::https://github.com/wader/fq/releases/download/v$pkgver/fq_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5cd19fcfe83b466cd247ae4b8adf9167290a8410e088312844bec61e986dfb75')

package() {
    tar xzf $srcdir/fq-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/fq" "$pkgdir/usr/bin/fq"
}
