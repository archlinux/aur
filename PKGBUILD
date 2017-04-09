# Maintainer: gue5t <gue5t@aur.archlinux.org>
pkgname=python-mastodon
pkgver=1.0.6
pkgrel=1
pkgdesc="python bindings for the Mastodon RPC API"
arch=('any')
url="https://pypi.python.org/pypi/Mastodon.py"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://pypi.python.org/packages/21/d2/a5e1888996ad00d3fc88b4383bd4c3eac96a49d91e552df17266f18d58fb/Mastodon.py-$pkgver.tar.gz)
noextract=()
md5sums=('0f6a9879c718adfcc1aa251a5208b7dd')

build() {
  : #nothing to do?
}

package() {
  cd "Mastodon.py-$pkgver"

  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}