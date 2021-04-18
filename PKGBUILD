# Maintainer: Ewen Le Bihan <hey@ewen.works>
pkgname=ideaseed
pkgver=1.0.0
pkgrel=1
pkgdesc="Note down your ideas and get them to the right place, without switching away from your terminal"
arch=(any)
url="https://github.com/ewen-lbh/ideaseed"
license=("MIT")
makedepends=("python" "python-pip")
conflicts=("ideaseed-git")
package() {
  pip install ideaseed==$pkgver --root="$pkgdir" --prefix=/usr
}
