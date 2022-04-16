# Maintainer: Aleksana QWQ <me@aleksana.moe>

pkgname=hyfetch
pkgver=1.0.4
pkgrel=1
pkgdesc="Neofetch with LGBTQ pride flags."
arch=('any')
url='https://github.com/hykilpikonna/hyfetch'
license=('MIT')
depends=('python' 'python-hypyutils')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --root="$pkgdir" --optimize=1
}
