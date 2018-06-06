# Maintainer: gue5t <gue5t@aur.archlinux.org>
pkgname=python-mastodon
pkgver=1.3.0
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
source=(https://files.pythonhosted.org/packages/f5/11/2c3973e8036e51c8b2e9e0d6115c16ed632e8a63082cf5f45a6d74f6846e/Mastodon.py-1.3.0.tar.gz)
noextract=()
sha256sums=('339a60c4ea505dd5b6c8f6ac076ce40f9e7bdfcd72d9466869da8bf631e4b9f5')

build() {
  : #nothing to do?
}

package() {
  cd "Mastodon.py-$pkgver"

  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
