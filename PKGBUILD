# Maintainer: Ewen Le Bihan <hey@ewen.works>
pkgname=wikitrad
pkgver=0.2.0
pkgrel=3
pkgdesc="A CLI to translate terms with wikipedia"
arch=(any)
url="https://github.com/ewen-lbh/wikitrad"
license=("GPL")
makedepends=("python" "python-pip")
conflicts=("wikitrad-git")
package() {
  pip install wikitrad==$pkgver --root="$pkgdir" --prefix=/usr
}
