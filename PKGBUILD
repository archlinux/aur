# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-sandwich
pkgver=1.0.0
pkgrel=1
pkgdesc="Set of operators and textobjects to search/select/edit sandwiched texts."
arch=(any)
depends=(vim)
groups=(vim-plugins)
url="https://github.com/machakann/vim-sandwich"
license=(custom:vim)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('45ea09a8a8818e0bbee2f48e856de875e687128d3086e508e5a0ddcaf883c156')

package() {
  cd vim-sandwich-$pkgver
  find autoload plugin after macros doc \
    -type f \
    -exec install -D {} "$pkgdir"/usr/share/vim/vimfiles/{} \;
}
