# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=python-pyxr
pkgver=1.0.6
pkgrel=1
pkgdesc="An object-relational mapping-ish wrapper around Xlib and X's resource manager/xrdb"
arch=('any')
url="https://pypi.org/project/pyxr/"
license=('MIT')
depends=('python')
makedepends=('python-wheel' 'python-installer')
source=("https://files.pythonhosted.org/packages/cb/d1/f0312ac4d5e218f30c80e6f774da7178bbf228b55b09af6fe35ad5f8627d/${pkgname/python-/}-${pkgver}-py3-none-any.whl")
sha256sums=('9105186200ba0084edb5e725fa6e1f7dc85c6c21a00fc70f0f02438b27e13027')
noextract=("${pkgname/python-/}-${pkgver}-py3-none-any.whl")

package() {
  python -m installer -d "${pkgdir}" *.whl
}
