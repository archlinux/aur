# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsaa
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.11.2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-aa'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
  'vapoursynth-plugin-vskernels'
  'vapoursynth-plugin-vsexprtools'
  'vapoursynth-plugin-vsrgtools'
  'vapoursynth-plugin-vsmasktools'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/04/98/edcafb11b8f2ca9649a08bb14837e52ef59d7040e69b2bd24bea37ca563c/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('1c970b993eb536a9e2801ec82fb8b3ced621cda7429efae3cbeb9a423359098c')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
