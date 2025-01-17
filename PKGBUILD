# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vstools
pkgname=vapoursynth-plugin-${_plug}
pkgver=3.3.4
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-tools'
license=('MIT')
depends=(
  'vapoursynth'
  'python-rich'
  'python-stgpytools'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/88/d6/0c7602dab6d39a8a483327becde2f4df9b18684f9176d77ef3a29c387226/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('e53da14e8566526c8b59e6e5a9d95efd6947e4006c7ae8c1acb1036278200c49')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
