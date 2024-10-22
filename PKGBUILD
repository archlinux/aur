# Maintainer: P.J. Grochowski <pawel.grochowski.dev@gmail.com>

_appname="kast"
pkgname="${_appname}-bin"
pkgver="1.4.1"
pkgrel=1
pkgdesc="Cast videos (with subtitles) straight from your PC."
arch=('x86_64')
url="https://bitbucket.org/massultidev/kast/"
license=('MIT')
makedepends=('coreutils' 'tar')
provides=("${_appname}")
options=('!strip')
_install_script="setup_${_appname}_${pkgver}_${arch}.bash"
source=("${url}downloads/${_install_script}")
sha256sums=("096bbf87982df0f84a7de435ea525090cd9c2704e91512ed18b4f35ac3852050")

package() {
    script="${srcdir}/${_install_script}"
    bash "${script}" -r "${pkgdir}"
}
