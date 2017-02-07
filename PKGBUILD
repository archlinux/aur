# Maintainer: Olivier Galibert <galibert@pobox.com>
# Contributor: Philip Mueller <mail at philip.in-aachen dot net>
pkgname=emacs-yaml-mode
pkgver=0.0.13
pkgrel=1
pkgdesc="Emacs major mode for editing files in the YAML data serialization format"
arch=('any')
url="https://github.com/yoshiki/yaml-mode"
license=('GPL')
groups=()
depends=('emacs')
install=emacs-yaml-mode.install
source=(https://github.com/yoshiki/yaml-mode/archive/v$pkgver.tar.gz)
md5sums=('22a94319ba03a94578dfdfae11f8b5ae')

package() {
  cd $srcdir/yaml-mode-$pkgver
  # Install the mode for Emacs
  install -D -m644 yaml-mode.el $pkgdir/usr/share/emacs/site-lisp/yaml-mode.el
}
