# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsaa
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.12.1
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
source=("https://files.pythonhosted.org/packages/24/05/5bd9b4b24f2ed72521765299133edd3cad5ab5388edfe801dcf7f7f2952a/vsaa-1.12.1-py3-none-any.whl")
sha256sums=('57dc674991c20ce9f8a9d8559b227449880044ec155209ad3b9dccb7fbe9fc1c')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
