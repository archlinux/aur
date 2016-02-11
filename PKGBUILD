# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=pyew-git
pkgver=100.2d086a1
pkgrel=1
pkgdesc="A python tool for static malware analysis"
arch=('any')
url="https://code.google.com/p/pyew/"
license=('GPLv2')
depends=('python2')
optdepends=('libemu' 'pylibemu' 'pil' 'python2-pillow' 'pygtk')
makedepends=('git')
source=('git+https://github.com/joxeankoret/pyew')
md5sums=('SKIP')
install="pyew.install"

pkgver() {
  cd pyew
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}


package() {
  install -d ${pkgdir}/opt/pyew/
  cp -r pyew/* ${pkgdir}/opt/pyew/
  
}

# vim:set et sw=2 ts=2 tw=79:
