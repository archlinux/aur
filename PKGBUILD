# Maintainer: Brandon Waskiewicz <brandon.waskiewicz@gmail.com>

pkgname=ttf-dina-remastered
pkgver=20201220
_commit=82b0167371dcac934d89f2f3cba80eab00648ad2
pkgrel=1
pkgdesc='Dina Font TTF Remastered'
arch=(any)
url='https://github.com/zshoals/Dina-Font-TTF-Remastered'
license=(custom)
makedepends=(git)
source=(git+https://github.com/zshoals/Dina-Font-TTF-Remastered#commit=$_commit)
sha256sums=('SKIP')

package_ttf-dina-remastered() {
  cd Dina-Font-TTF-Remastered
  install -Dm644 Fonts/*.tt[fc] -t "$pkgdir"/usr/share/fonts/TTF
}

