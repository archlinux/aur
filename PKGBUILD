# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsrgtools
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.8.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-rgtools'
license=('MIT')
depends=(
  'vapoursynth'
  'vapoursynth-plugin-vstools'
  'vapoursynth-plugin-vspyplugin'
  'vapoursynth-plugin-vsexprtools'
)
makedepends=('python-pip')
optdepends=(
  'vapoursynth-plugin-removegrain'
  'vapoursynth-plugin-rgsf'
  'vapoursynth-plugin-vsakarin'
)
source=("https://files.pythonhosted.org/packages/72/33/00aaa0b1e4a4bb9a83559aa45ea61e8c43b844bf4db3f9227afbe3f965b0/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('c087ff1458a7ccff878150cc7b27484982dbbe0c64dca6aa720bbfa5c6faca14')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
