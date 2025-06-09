# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vspyplugin
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.4.5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-pyplugin'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/b7/af/332213da20ebf9e35b0b81beab9166a734c9b79e30b4d0f7ce6a50655400/vspyplugin-1.4.5-py3-none-any.whl")
sha256sums=('de6331c2caebc92f96162279860e84f32a516cd9edb54773662458bbe56dc725')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
