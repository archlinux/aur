
pkgver=0.0.3
pkgname=cpsula-git
pkgrel=1
pkgdesc='A bare-bones Gemini server which serves Lua-generated content'
url='https://github.com/lowquark/cpsula'
license=('MIT')
arch=('x86_64')
provides=('cpsula')
depends=('libevent' 'openssl' 'lua')
makedepends=()
conflicts=()
replaces=()
backup=('etc/cpsula/cpsula.conf')
source=('git+https://github.com/lowquark/cpsula.git')
sha256sums=('SKIP')

build() {
  cd "$srcdir/cpsula"
  make
}

package() {
  cd "$srcdir/cpsula"
  make install INSTALL_ROOT=$pkgdir
}

