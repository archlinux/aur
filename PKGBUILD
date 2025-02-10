# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsexprtools
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.8.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-exprtools'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/e4/20/52646fd9e7ea316fe8c765cb5b1357980913f0f17ee5cf0bcb84dcca3ee5/vsexprtools-1.8.1-py3-none-any.whl")
sha256sums=('8ad70634ec1479253f1721adb92b1c0d5642494ab3fcaeff4d10f33a631b7ffc')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
