# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=bulk-rename-plus
pkgver=1.6.0
pkgrel=2
pkgdesc='A compact yet potent command-line tool designed for efficiently renaming paths in bulk, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/bulk-rename-plus"
license=('GPL3')
depends=('bash' 'coreutils')
md5sums=('c99b55c7ed096671ce489dc86a0004c4')

source=("https://github.com/siyia2/bulk-rename-plus/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 bulk_rename++ "$HOME/.local/bin/bulk_rename++"
  
}
