# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsdehalo
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.9.2
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
source=("https://files.pythonhosted.org/packages/3c/65/aa666b3a33c773386c80d8fc6ef17eb1a9f9f4881a75b8b333a48a05d873/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('9bd5d4297fbc980f7fd8de2c2eb4e7e473a8c7cbda8704b45fbdb6f83d5412ab')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
