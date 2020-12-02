# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=spotify-search-provider
pkgver=1.0.0
pkgrel=1
pkgdesc="GNOME Shell search provider for Spotify"
arch=("any")
url="https://github.com/arrufat/spotify-search-provider/"
license=("GPL-3.0")
depends=("python-gobject" "python-dbus" "python-spotipy")
source=("https://github.com/arrufat/spotify-search-provider/archive/v${pkgver}.tar.gz")
md5sums=('64cf9ffafbab4ea4247faf7f14e0450c')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DATADIR="$pkgdir/usr/share" \
    LIBDIR="$pkgdir/usr/lib" \
    ./install.sh
}
