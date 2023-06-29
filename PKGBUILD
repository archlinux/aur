# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: fauxmight

_pkg="alacritty"
pkgname="${_pkg}-theme"
pkgver=0.0.1
pkgrel=2
pkgdesc="Collection of Alacritty color schemes."
arch=('any')
url="https://github.com/${_pkg}/${pkgname}"
license=('apache')
depends=("${_pkg}")
makedepends=(
# git
)
_commit="914f463390b660e99731f93a6ad9493918cd5d13"
source=(
  # "${pkgname}::git+${url}#commit=${_commit}"
  "${url}/archive/${_commit}.zip"
)
b2sums=(
  '39f6976340c8d169109af23523efc013e4e35cc3397d792d8ef814c6a202ad8cc7b852c6b4b8caffcc7346e3943ded59d0cb70b2373648809607f5c23e6c84a7'
)

package() {
  _srcdir="${srcdir}/${pkgname}/themes"
  _output="${pkgdir}/usr/share/alacritty"
  install -dm755 "${_srcdir}" "${_output}"
  cp -r "${_srcdir}" "${_output}"
}

# vim:set sw=2 sts=-1 et:
