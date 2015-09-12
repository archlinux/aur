# Maintainer: Olivier Galibert <galibert@pobox.com>
# Contributor: Philip Mueller <mail at philip.in-aachen dot net>
pkgname=emacs-yaml-mode
pkgver=0.0.12
pkgrel=1
pkgdesc="Emacs major mode for editing files in the YAML data serialization format"
arch=('any')
url="https://github.com/yoshiki/yaml-mode"
license=('GPL')
groups=()
depends=('emacs')
install=emacs-yaml-mode.install
source=https://github.com/yoshiki/yaml-mode/archive/v$pkgver.tar.gz
md5sums=('8976243eee9d7df0fdb8fa99a698035a')

package() {
  cd $srcdir/yaml-mode-$pkgver
  # Install the mode for Emacs
  install -D -m644 yaml-mode.el $pkgdir/usr/share/emacs/site-lisp/yaml-mode.el
}
