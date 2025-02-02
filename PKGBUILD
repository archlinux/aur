# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=spotify-search-provider
pkgver=1.0.2
pkgrel=1
pkgdesc="GNOME Shell search provider for Spotify"
arch=("any")
url="https://github.com/arrufat/spotify-search-provider/"
license=("GPL-3.0")
depends=("python-gobject" "python-dbus" "python-spotipy")
source=("https://github.com/arrufat/spotify-search-provider/archive/v${pkgver}.tar.gz")
md5sums=('0a3eb3a6d0711866e0fc8bceb611394f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DATADIR="$pkgdir/usr/share" \
    LIBDIR="$pkgdir/usr/lib" \
    ./install.sh
}
