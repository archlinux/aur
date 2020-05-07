# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Based on the git package by Manuel Palenzuela

pkgname=python-cloudscraper
_author=VeNoMouS
_gitname=cloudscraper
pkgver=1.2.36
pkgrel=1
pkgdesc='A Python module to bypass Cloudflare anti-bot page. (Release version)'
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
sha256sums=('06a3088d1d337efe0b2194a10a84551f01f3cf60f0c984b5c959dd87c924fbfa')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
}
