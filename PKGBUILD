# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vssource
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.11.2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-source'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
)
optdepends=(
  'vapoursynth-plugin-bestsource'
  'vapoursynth-plugin-lsmashsource'
  'vapoursynth-plugin-d2vsource'
  'vapoursynth-plugin-dgdecodenv'
  'vapoursynth-plugin-imwri'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/79/24/bd2a5bac8bc2baad5833eb346ccc3bb1ff25c4057b52c7f5bd652ab4b374/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('a6f1f4ae856d38fa8876dfef7d8cf4fe97494ae5f680de5c8fece088650b5452')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
