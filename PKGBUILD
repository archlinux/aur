pkgname=iview  # TODO: python-iview
_rev=f0981c8
pkgver="386+g$_rev"  # Commit count: git rev-list --count "$_rev"
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
md5sums=(41913acfdedf39d386b7c49c7c897cf1)

package() {
    cd "$srcdir/vadmium-python-iview-$_rev"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
