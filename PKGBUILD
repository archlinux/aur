# Maintainer: Adrian <adrianjohn824@gmail.com>
# Contributor: Adrian <adrianjohn824@gmail.com>

pkgname=screenshot-util
_pkgname=screenshot-util
pkgver=1.0.0
pkgrel=1
pkgdesc="A small helper script running on wayland to make screenshots"
url="https://github.com/AdrisGithub/${_pkgname}"
arch=('any')
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash' 'grim' 'slurp' 'swappy')
makedepends=('git')
source=("$pkgname::git+https://github.com/AdrisGithub/$pkgname.git")
md5sums=('SKIP')
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

