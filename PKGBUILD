# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-bin"
_pkgname="customfetch"
pkgver=1.0.0
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (Binary files)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
#depends=() # some of them are in the "base" meta-package anyway so basically no extra depends
optdepends=(
        'wayland: Library for getting the Wayland compositor faster'
        'dconf: Alternative to the slow gsettings command'
        'libxfce4util: Query XFCE4 version faster'
)
conflicts=('customfetch-gui-git' 'customfetch-gui' 'customfetch-git' 'customfetch-gui-bin')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=("78810b20c622660de637b019f4b297d2c6370b0d5aa466dd3024216419a405af")

package() {
    cd "${srcdir}/"
    mv "usr/" "${pkgdir}"
}
