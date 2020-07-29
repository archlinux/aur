# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Based on the git package by Manuel Palenzuela

pkgname=python-cloudscraper
_author=VeNoMouS
_gitname=cloudscraper
pkgver=1.2.46
pkgrel=1
pkgdesc='A Python module to bypass Cloudflare anti-bot page. (Release version)'
url='https://pypi.org/project/cloudscraper'
arch=('any')
license=('MIT')
depends=(
  python
  python-requests
  python-js2py
  python-requests-toolbelt
)
optdepends=('nodejs: use Node.js Javascript Interpreter/Engine')
makedepends=('git' 'python-setuptools')
provides=('python-cloudscraper')

source=("$_gitname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/e3/67/12931f5b2128034461e8b6ebce38073d29017442ff9d0154f5c88f15e1ae/$_gitname-$pkgver.tar.gz")
sha256sums=('793095bbc37aae84a5c38d9f66b56f3c83a00f0b1ff2d334f75a2b8f88b924af')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
}
