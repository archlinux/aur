# Maintainer: P.J. Grochowski <pawel.grochowski.dev@gmail.com>

_appname="kast"
pkgname="${_appname}-bin"
pkgver="1.1.1"
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
sha256sums=("2570863e98f81bb269d562ddd4bd275efdaf8c5f216d58c2b3a51c07596c9f4d")

package() {
    script="${srcdir}/${_install_script}"
    bash "${script}" -r "${pkgdir}"
}
