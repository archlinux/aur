# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=shell-advancedutils
pkgver=2.0.0
pkgrel=1
pkgdesc="Advanced commands to extend SH/Bash shell scripting into a more powerful language"
arch=('i686' 'x86_64')
license=('GPLv2')
url="http://github.com/kata198/shell-advancedutils"
makedepends=('python-setuptools' 'python' 'bash')
depends=('python-setuptools' 'python' 'bash')
source=("https://github.com/kata198/shell-advancedutils/archive/${pkgver}.tar.gz")
sha512sums=("606f92bc3ca26dc6bf05cb2ae108a8280dbb24983eb1ceac329c88436f86118ff02010df2301e4d44a123448c0b979418893bcc817f26c0419935a98531787e8")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
