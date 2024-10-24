# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=capter
pkgname=${_basename}-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="A simple cross-platform screenshot tool made in rust"
arch=('x86_64')
url="https://github.com/decipher3114/capter"
license=("Apache-2.0")
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=("git" "gtk3" "xdotool" "libayatana-appindicator" "libxcb" "libxrandr" "dbus")
source=("https://github.com/decipher3114/Capter/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums=('644de6bfb3277146c749001a705ed98b7fa0181d51c9dd70303499aeb3707539')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"
} 
