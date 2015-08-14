# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=quad
pkgver=1.12
pkgrel=5
pkgdesc="High-performance file compressor that utilizes an advanced LZ-based compression algorithm"
arch=(i686 x86_64)
url=http://quad.sourceforge.net
license=(LGPL2.1)
conflicts=(mesa-demos)
source_i686=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver-linux_i486.tar.gz")
source_x86_64=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver-linux_amd64.tar.gz")
md5sums_i686=('ec8302170d6011d6905c2f558fedbf5f')
md5sums_x86_64=('bc3811bd3e7bba48450f4e59b80b77ee')
sha256sums_i686=('b6f5f8db02a47cf7741b8bc95ce0fd9bb5f36e3df083dc4006cd8c05d2323ac5')
sha256sums_x86_64=('01f94e39f85284e2e1f955f85287c74e5396088f99d50006794ea520c936d562')

package() {
    install -Dm755 "$srcdir"/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 "$srcdir"/README "$pkgdir"/usr/share/doc/$pkgname/README
}
