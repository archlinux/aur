# Maintainer: P.J. Grochowski <pawel.grochowski.dev@gmail.com>

_appname="kast"
pkgname="${_appname}-bin"
pkgver="1.1.2"
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
sha256sums=("bea9ae9208f97bc454f4acf986e68282a6705d34f66da26bdecbd75e3c502786")

package() {
    script="${srcdir}/${_install_script}"
    bash "${script}" -r "${pkgdir}"
}
