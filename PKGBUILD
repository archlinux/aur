# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-dashtable
pkgver=1.4.5
pkgrel=1
arch=('x86_64')
url='https://github.com/doakey3/DashTable'
license=('MIT')
depends=('python-beautifulsoup4' 'python-docutils')
makedepends=('python-pip')

package(){
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dashtable==$pkgver
}
