# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Based on the git package by Manuel Palenzuela

pkgname=python-cloudscraper
_author=VeNoMouS
_gitname=cloudscraper
pkgver=1.2.24
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
  nodejs
)
makedepends=('git' 'python-setuptools')
provides=('python-cloudscraper')

source=("$_gitname-$pkgver.tar.gz::https://www.github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('bd35e391546f3f3a4d9c934ff2b75160d02bb23f189fe253e3d9a82a7f228286')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
} 
