# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Based on the git package by Manuel Palenzuela

pkgname=python-cloudscraper
_author=VeNoMouS
_gitname=cloudscraper
pkgver=1.2.42
pkgrel=1
pkgdesc='A Python module to bypass Cloudflare anti-bot page. (Release version)'
url='https://pypi.org/project/cloudscraper'
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

source=("$_gitname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/be/48/8e0ef562d1a10e0b4348fc49f219a0ea8cc0be92dc6d6680e21bf94488c0/$_gitname-$pkgver.tar.gz")
sha256sums=('1d4e158de3be7a4e651083f13a14a25b75853186e989d9d97db1a08056b7a0b6')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
}
