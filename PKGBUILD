# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=fq-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='Tool, language and decoders for inspecting binary data.'
url='https://github.com/wader/fq'
license=('custom')
arch=('x86_64')
provides=('fq')
source=("fq-$pkgver-$pkgrel.tgz::https://github.com/wader/fq/releases/download/v$pkgver/fq_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a0b93ce71d03eb98b5f8106a1596540606ce1295c0cb1db6e459276e5df51269')

package() {
    tar xzf $srcdir/fq-$pkgver-$pkgrel.tgz
    install -Dm 755 "$srcdir/fq" "$pkgdir/usr/bin/fq"
}
