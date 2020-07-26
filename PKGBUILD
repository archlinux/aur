# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Based on the git package by Manuel Palenzuela

pkgname=python-cloudscraper
_author=VeNoMouS
_gitname=cloudscraper
pkgver=1.2.44
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

source=("$_gitname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/b9/18/89099edb382ad4da656b4d5c5023dca00bcfa7660870ede126927d2b5301/$_gitname-$pkgver.tar.gz")
sha256sums=('fff13eb5c39e79956a1a6ecdb83fbe66d8f0566a42939e6491b71f28c44beb78')

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root=$pkgdir
}
