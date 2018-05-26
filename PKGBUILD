# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=kernel-update-hook
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="Hook to load all modules you might need into the kernel."
arch=('any')
url="https://github.com/kcolford/kernel-update-hook"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url"/archive/v"$pkgver".tar.gz)
noextract=()
md5sums=('e4f6fff59f0ef9d009b23aeec8e7c37f')
sha256sums=('919079483a876f0cdc4f2196037316f26db7876ccc74c1e3f74a9ff434baa214')
sha512sums=('8733097024ccd2bbe7e27cbd3f2b1c56bfc383f5a811f94f51d35dbb48f62296b48008a9307c9a357719049562c8980830add65ed97a9cb498be5925bc428d4b')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
