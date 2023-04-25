# Maintainer: TransparentLC <akarin.dev>
# Packager: Malingshu <myy0222@gmail.com>

pkgname=xdao
pkgrel=1
pkgver=1.2.0.230425
pkgdesc="An nmbXD TUI cli written in Python."
arch=('any')
url="https://github.com/TransparentLC/xdcmd"
license=('AGPL-3.0')
sha256sums=('SKIP')
depends=(
  'imagemagick'
  'glib2'
  )
makedepends=()
install=${pkgname}.install
source=("https://nightly.link/TransparentLC/xdcmd/workflows/build/master/xdcmd-ubuntu.zip")


package() {
  cd "${pkgdir}"
  mkdir -p usr/bin
  mkdir -p usr/share/xdao
  tar -xvJf ${srcdir}/xdcmd-ubuntu.tar.xz -C usr/share/xdao
  ln -s /usr/share/xdao/xdcmd-ubuntu/xdcmd usr/bin/xdao
}
