# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=pyew-git
pkgver=100.2d086a1
pkgrel=1
pkgdesc="pyew - a python tool for static malware analysis"
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


# vim:set ts=2 sts=2 sw=2 et
