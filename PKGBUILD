# Maintainer: P.J. Grochowski <pawel.grochowski.dev@gmail.com>

_appname="kast"
pkgname="${_appname}-bin"
pkgver="1.1.0"
pkgrel=1
pkgdesc="Cast videos (with subtitles) straight from your PC."
arch=('x86_64')
url="https://bitbucket.org/massultidev/kast/"
license=('MIT')
makedepends=('coreutils' 'tar')
provides=("${_appname}")
options=('!strip')
_install_script="setup_${_appname}_${pkgver}.bash"
source=("${url}downloads/${_install_script}")
sha256sums=("465e6998748d3f3b7cf10cdf91db2734abd37e3a74360fbe489fa2bb2e66c725")

package() {
    script="${srcdir}/${_install_script}"
    bash "${script}" -r "${pkgdir}"
}
