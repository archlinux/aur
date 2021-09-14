# Maintainer: Alice S. <quarkyalice@disroot.org>
pkgname=install-date-git
pkgver=0.1
pkgrel=1
pkgdesc="Determine the install date of your Linux install"
arch=('i686' 'x86_64')
url="https://github.com/alicela1n/install-date"
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
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 install-date ${pkgdir}/usr/bin/install-date
}
