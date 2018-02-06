# Maintainer: gue5t <gue5t@aur.archlinux.org>
pkgname=python-mastodon
pkgver=1.2.2
pkgrel=1
pkgdesc="python bindings for the Mastodon RPC API"
arch=('any')
url="https://pypi.python.org/pypi/Mastodon.py"
license=('GPL')
groups=()
depends=(python-requests python-dateutil python-six python-pytz python-decorator)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://pypi.python.org/packages/4b/8e/a041ce004d4cc026ff931b3f664db959cb1ba5902e2caf9bd6ec726723ab/Mastodon.py-1.2.2.tar.gz)
noextract=()
md5sums=('2504bf5669109cdd92bdcd1c4e92f310')

build() {
  : #nothing to do?
}

package() {
  cd "Mastodon.py-$pkgver"

  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
