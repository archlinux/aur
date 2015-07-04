pkgname=iview  # TODO: python-iview
_rev=caf7267
pkgver="387+g$_rev"  # Commit count: git rev-list --count "$_rev"
pkgrel=1
pkgdesc="Alternative frontend for ABC TV's Iview service"
url="https://github.com/vadmium/python-iview"
arch=(any)
license=(GPL3)
makedepends=(python3)
depends=(python3)
optdepends=(
    "python-socks: Proxy support"
    "python-gobject: GTK frontend"
    "gtk3: GTK frontend"
    "rtmpdump: News 24 live stream"
)
provides=(python-iview)

source=("https://github.com/vadmium/python-iview/tarball/$_rev")
md5sums=(a7405d6896de5543ea5a4e5078b0eb25)

package() {
    cd "$srcdir/vadmium-python-iview-$_rev"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
