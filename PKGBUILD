# Maintainer: Lightwing <teddyzct[at]outlook[dot]com>
pkgname=fcitx-shuoxie-git
pkgver=current
pkgrel=3
pkgdesc="Input with speaking or handwriting (Simplified Chinese Only)"
url="https://gitee.com/hebinq/shuoxie"
arch=('x86_64')
license=('GPL2')
depends=('fcitx' 'gtk3')
optdepends=()
makedepends=('cmake' 'git')
conflicts=()
replaces=()
backup=()
install=()
source=()
md5sums=()
prepare() {
  cd "${srcdir}/"
  git clone https://gitee.com/hebinq/shuoxie.git
}
build() {
  cd "${srcdir}/shuoxie"
  cmake ./
  make
}

package() {
  cd "${srcdir}/shuoxie"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
