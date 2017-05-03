# Maintainer: gue5t <gue5t@aur.archlinux.org>
pkgname=python-mastodon
pkgver=1.0.7
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
source=(https://pypi.python.org/packages/8c/f4/60bcaa9ead46508403d27eb831b89b64ec1a119ea2657b5a2eb1391e2c81/Mastodon.py-1.0.7.tar.gz)
noextract=()
md5sums=('d1f1030d35d647b2fddc09096c3336d8')

build() {
  : #nothing to do?
}

package() {
  cd "Mastodon.py-$pkgver"

  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
