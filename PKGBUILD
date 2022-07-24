# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=fq-bin
pkgver=0.0.8
pkgrel=1
pkgdesc='Tool, language and decoders for inspecting binary data.'
url='https://github.com/wader/fq'
license=('custom')
arch=('x86_64')
provides=('fq')
source=("fq-$pkgver-$pkgrel.tgz::https://github.com/wader/fq/releases/download/v$pkgver/fq_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ecfcde8f1b0f0d41c2b0237c4d3cd81c64fdac71cf16a299ad83d6aeb447cd15')

package() {
    tar xzf $srcdir/fq-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/fq" "$pkgdir/usr/bin/fq"
}
