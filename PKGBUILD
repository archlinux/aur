# Maintainer: madflow <madflow@localhost>
pkgname=shrr
pkgver=0.1
pkgrel=1
pkgdesc="Lets you share a file or folder via HTTP"
arch=('any')
url="https://gitlab.com/madflow/shrr"
license=(MIT)
groups=()
depends=('python>=3.3', 'python-flask')
makedepends=('python-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}