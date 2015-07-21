# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
pkgname=boost.dll-git
pkgver=222.4deb402
pkgrel=1
pkgdesc="Library for comfortable work with DLL and DSO."
arch=('any')
url="http://apolukhin.github.io/Boost.DLL/index.html"
license=('GPL')
groups=()
depends=('boost')
makedepends=('git')
provides=('boost.dll')
conflicts=('boost.dll')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/apolukhin/Boost.DLL.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir"/usr
  cp -a include "$pkgdir"/usr/include
}

# vim:set ts=2 sw=2 et:
