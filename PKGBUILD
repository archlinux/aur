# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=bulk-rename-plus
pkgver=1.0.8
pkgrel=1
pkgdesc='Tiny and powerfull cmd tool for bulk renaming recursively path(s), written in C++'
arch=('x86_64')
url="https://github.com/siyia2/bulk-rename-plus"
license=('GPL3')
depends=('bash' 'coreutils')
md5sums=('45fa5602f9d75c59abff4566202f7b02')

source=("https://github.com/siyia2/bulk-rename-plus/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 bulk_rename++ "$HOME/.local/bin/bulk_rename++"
  
}
