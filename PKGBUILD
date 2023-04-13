# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=fq-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Tool, language and decoders for inspecting binary data.'
url='https://github.com/wader/fq'
license=('custom')
arch=('x86_64')
provides=('fq')
source=("fq-$pkgver-$pkgrel.tgz::https://github.com/wader/fq/releases/download/v$pkgver/fq_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a56f9f25e100171c28df0f65e5a084a560b9d865760fd8b80a37db501464c902')

package() {
    tar xzf $srcdir/fq-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/fq" "$pkgdir/usr/bin/fq"
}
