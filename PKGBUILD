# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsexprtools
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.7.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-exprtools'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/e4/09/417d454d2ed7813d6bb4bf23c06952a9a6c3b416db5137cb328d38b9e048/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('e80fbc0ca58ad23d0c0bbe9d1f35f314d396e071bffcd8ec33b5b9d7a44fb549')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
