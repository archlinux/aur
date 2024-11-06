# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=spotify-search-provider
pkgver=1.0.1
pkgrel=2
pkgdesc="GNOME Shell search provider for Spotify"
arch=("any")
url="https://github.com/arrufat/spotify-search-provider/"
license=("GPL-3.0")
depends=("python-gobject" "python-dbus" "python-spotipy")
source=("https://github.com/arrufat/spotify-search-provider/archive/v${pkgver}.tar.gz")
md5sums=('06285ac3e55eae83e9ff08123a0fdb34')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DATADIR="$pkgdir/usr/share" \
    LIBDIR="$pkgdir/usr/lib" \
    ./install.sh
}
