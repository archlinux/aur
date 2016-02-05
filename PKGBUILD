# Maintainer: Bob Gregory <pathogenix@gmail.com>
pkgname=liblognorm
pkgver=1.1.2
pkgrel=1
pkgdesc="A fast-samples based normalization library"
arch=('i686' 'x86_64')
url=""
license=('GPL2', 'Apache')
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
source=(https://github.com/rsyslog/$pkgname/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('747e5d06302f6d92552bdc2ab910ee7c')

build() {
      cd "$pkgname-$pkgver"
        autoreconf -fvi
        ./configure --prefix=/usr
        make
      }

package() {
    cd "$pkgname-$pkgver"

      make DESTDIR="$pkgdir/" install
  }
