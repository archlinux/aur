# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=bulk-rename-plus
pkgver=1.5.7
pkgrel=1
pkgdesc='Tiny and powerful cmd tool for bulk renaming recursively paths, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/bulk-rename-plus"
license=('GPL3')
depends=('bash' 'coreutils')
md5sums=('2c513201833ee897c040309f30fdf482')

source=("https://github.com/siyia2/bulk-rename-plus/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 bulk_rename++ "$HOME/.local/bin/bulk_rename++"
  
}
