# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Based on the git package by Manuel Palenzuela

author=VeNoMouS
pkgname=python-cloudscraper
_gitname=cloudscraper
pkgver=1.2.18
pkgrel=2
pkgdesc='A Python module to bypass Cloudflares anti-bot page. (Release version)'
url='https://github.com/VeNoMouS/cloudscraper.git'
arch=('any')
license=('MIT')
depends=('python-pyopenssl' 'python-requests' 'python-js2py' 'python-requests-toolbelt' 'python-brotli' 'python' 'nodejs')
makedepends=('git' 'python-setuptools')
provides=('python-cloudscraper')

source=("$pkgname-$pkgver.tar.gz::https://www.github.com/$author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('444f1771b0dc1e939d64b626e6aac2e72d5c578b4e7666350c46b6804a79ba24')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
} 
