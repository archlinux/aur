# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=bulk-rename-plus
pkgver=1.0.5
pkgrel=1
pkgdesc='Tiny and powerfull tool for bulk renaming recursively path(s) from the terminal, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/bulk-rename-plus"
license=('GPL3')
depends=('bash' 'coreutils')
md5sums=('6e6d18e5b899cd1e9056b5fb3353acf3')

source=("https://github.com/siyia2/bulk-rename-plus/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 bulk_rename++ "$HOME/.local/bin/bulk_rename++"
  
}
