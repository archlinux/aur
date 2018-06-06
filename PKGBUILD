# Maintainer: gue5t <gue5t@aur.archlinux.org>
pkgname=python-mastodon
pkgver=1.3.0
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
source=(https://files.pythonhosted.org/packages/f5/11/2c3973e8036e51c8b2e9e0d6115c16ed632e8a63082cf5f45a6d74f6846e/Mastodon.py-1.3.0.tar.gz)
noextract=()
sha256sums=('0d426c37795ed24cdf7affec7b3465cb76f9afc3f1d4dfbfd389b0b4459dbf4d')

build() {
  : #nothing to do?
}

package() {
  cd "Mastodon.py-$pkgver"

  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
