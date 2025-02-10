# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsdehalo
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.10.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-dehalo'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
  'vapoursynth-plugin-vskernels'
  'vapoursynth-plugin-vsexprtools'
  'vapoursynth-plugin-vsrgtools'
  'vapoursynth-plugin-vsmasktools'
  'vapoursynth-plugin-vsaa'
  'vapoursynth-plugin-vsscale'
  'vapoursynth-plugin-vsdenoise'
)
optdepends=('vapoursynth-plugin-misc')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/e9/4a/297ee1a346539e782382faa023616aa96469efe43b46cc0fe0e5e088614e/vsdehalo-1.10.1-py3-none-any.whl")
sha256sums=('7422c4dbd10b43ab361c396b7963f8c8141c8865e968e07a633e100af8f53e64')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
