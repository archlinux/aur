# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=vncpwd
pkgver=0.1
pkgrel=1
pkgdesc="VNC Password Decrypter"
arch=('x86_64')
url="https://github.com/jeroennijhof/vncpwd"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab9112b71afbc17b6100964b6358041877cb154849785baa1152d13b5c459070')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
