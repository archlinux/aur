# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=kernel-update-hook
pkgver=1.0.0
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
md5sums=('2544d7023f13a05add21122bf89a28da')
sha256sums=('1f9f9efee5f2756340a72340aef315c255bad9c202753c0ff35817d0fd1c6a3c')
sha512sums=('f56b7390c28762fa916e3e0d23aae2a576eccbbf76a7639f8f142e0a15078a87b132546f186c7ed7d31b3f611b15407c619419918b9e8e139fb00c9c12e591ed')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
