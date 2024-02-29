# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=bulk-rename-plus
pkgver=1.4.1
pkgrel=2
pkgdesc='Tiny and powerful cmd tool for bulk renaming recursively paths, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/bulk-rename-plus"
license=('GPL3')
depends=('bash' 'coreutils')
md5sums=('c297229cf76744e94788a40a2d8e7252')

source=("https://github.com/siyia2/bulk-rename-plus/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 bulk_rename++ "$HOME/.local/bin/bulk_rename++"
  
}
