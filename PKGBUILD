# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=koxtoolchain
pkgver=2025.05
pkgrel=1
pkgdesc='Build script for various toolchains used by KOReader.'
url='https://github.com/koreader/koxtoolchain'
license=('unknown')
arch=('any')
depends=(base-devel curl git gperf help2man unzip wget)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('7f1e8da60ebe2afb305c0d8dd3f3b5f21f30688786787c80a2f70f26b7b890a1b536863b1fb800c333470197a46968afc7cbf3890f7a2a494b1988b51f091b66')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" gen-tc.sh
    install -Dm644 refs/* "$pkgdir/usr/bin"
}
