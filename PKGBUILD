# Maintainer: Giovan Battista "giomba" Rolandi <giomba at develer dot com>
pkgname=comelz-quark-git
pkgver=2024.08.07
pkgrel=1
pkgdesc="Simple project dependency management system"
arch=('any')
url="https://github.com/comelz/quark"
license=('MIT')
depends=()
source=('git+http://github.com/comelz/quark.git')
sha256sums=('SKIP')

prepare() {
  # apply patches here
  # nothing to be done
  true
}

build() {
    # build here
    # nothing to be done
    true
}

package() {
  # copy "binaries"
  mkdir -p ${pkgdir}/opt/quark/
  cp -r ${srcdir}/quark/{bin,quark} ${pkgdir}/opt/quark/

  # symlink binary to path
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/quark/bin/quark ${pkgdir}/usr/bin/quark
}

