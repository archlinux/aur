# Maintainer: yurisuki <yurisuki@waifu.club>
pkgname=sp
pkgver=1
pkgrel=0
pkgdesc="sp, the command-line Spotify controller."
arch=('any')
url='https://gist.github.com/wandernauta/6800547'
depends=('spotify' 'dbus')
source=("sp::https://gist.githubusercontent.com/wandernauta/6800547/raw/2c2ad0f3849b1b1cd1116b80718d986f1c1e7966/sp")
sha512sums=('612e337379ec6aead8d8611ac77852de3b875b406764b2d628eee4f88724c249bc24ff99b879628970b952e93e65166a94dc07c5ca8df748db23b953457b868a')

package() {
install -Dm 755 "$srcdir/sp" "$pkgdir/usr/bin/sp"
}
