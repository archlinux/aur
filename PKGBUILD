# Maintainer: P.J. Grochowski <pawel.grochowski.dev@gmail.com>

_appname="kast"
pkgname="${_appname}-bin"
pkgver="1.3.0"
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
sha256sums=("56342122c06e50b62737ead3f025579caba170761b5c108cc610b4264bd4e728")

package() {
    script="${srcdir}/${_install_script}"
    bash "${script}" -r "${pkgdir}"
}
