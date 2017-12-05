# Maintainer: gue5t <gue5t@aur.archlinux.org>
pkgname=python-mastodon
pkgver=1.1.2
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
source=(https://pypi.python.org/packages/86/e2/bd6712e558a7fe1f3341979f0606f135abf3da1eff169474a8e068e947c5/Mastodon.py-1.1.2.tar.gz)
noextract=()
md5sums=('489f8b2e6bcc1cc4697c01fd3c8da046')

build() {
  : #nothing to do?
}

package() {
  cd "Mastodon.py-$pkgver"

  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
