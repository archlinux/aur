# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Based on the git package by Manuel Palenzuela

pkgname=python-cloudscraper
_author=VeNoMouS
_gitname=cloudscraper
pkgver=1.2.18
pkgrel=3
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
  python-brotli
  nodejs
)
makedepends=('git' 'python-setuptools')
provides=('python-cloudscraper')

source=("$_gitname-$pkgver.tar.gz::https://www.github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('444f1771b0dc1e939d64b626e6aac2e72d5c578b4e7666350c46b6804a79ba24')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
} 
