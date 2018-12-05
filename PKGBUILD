# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=shell-advancedutils
pkgver=2.2.1
pkgrel=1
pkgdesc="Advanced commands to extend SH/Bash shell scripting into a more powerful language"
arch=('i686' 'x86_64')
license=('GPLv2')
url="http://github.com/kata198/shell-advancedutils"
makedepends=('python-setuptools' 'python' 'bash')
depends=('python-setuptools' 'python' 'bash')
source=("https://github.com/kata198/shell-advancedutils/archive/${pkgver}.tar.gz")
sha512sums=("73f71ca6dd323a5a4d5e7c8ed71372c647ef50c3f3cd3c60069b64d7e693aa0498fbd49bd7e5fa521520d7d538c63cf6c3c19bd6816f5015ece422fd80a73cd7")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
