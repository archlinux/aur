# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Based on the git package by Manuel Palenzuela

pkgname=python-cloudscraper
_author=VeNoMouS
_gitname=cloudscraper
pkgver=1.2.28
pkgrel=1
pkgdesc='A Python module to bypass Cloudflares anti-bot page. (Release version)'
url='https://github.com/VeNoMouS/cloudscraper.git'
arch=('any')
license=('MIT')
depends=(
  python
  python-pyopenssl
  python-requests
  python-js2py
  python-requests-toolbelt
)
optdepends=('nodejs: use Node.js Javascript Interpreter/Engine')
makedepends=('git' 'python-setuptools')
provides=('python-cloudscraper')

source=("$_gitname-$pkgver.tar.gz::https://www.github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('9575ef9c5c12372b5f756f59db1ca1c0350eb55adf7a026b9a2117aae7ee004a')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
}
