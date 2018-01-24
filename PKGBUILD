# Maintainer: gue5t <gue5t@aur.archlinux.org>
pkgname=python-mastodon
pkgver=1.2.1
pkgrel=2
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
source=(https://pypi.python.org/packages/7e/76/628173f61485d2a87db752bbf9bad48d45455488a50bbd94ebf680f1d24f/Mastodon.py-1.2.1.tar.gz)
noextract=()
md5sums=('91ac1f8276717581f28c3393f7cf5ea2')

build() {
  : #nothing to do?
}

package() {
  cd "Mastodon.py-$pkgver"

  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
