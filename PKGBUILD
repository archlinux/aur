# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Kalle Lindqvist <kalle.lindqvist@mykolab.com>
pkgname=gnome-shell-extension-sound-output-device-chooser
_pkgname=gse-sound-output-device-chooser
pkgver=42.43
_pkgver=43
pkgrel=2
pkgdesc="Sound Input & Output Device Chooser."
arch=('any')
url="https://github.com/kgshank/gse-sound-output-device-chooser"
license=('GPL')
conflicts=('gnome-shell-extension-sound-output-device-chooser-git')
depends=('gnome-shell')
optdepends=('python: for new profile identification')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kgshank/${_pkgname}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('255b31d3013b8896c9a062b324a5c76cd5d7941e331797ba29fa6cd69083337b')

package() {
    _uuid="sound-output-device-chooser@kgshank.net"

    cd "${srcdir}/${_pkgname}-${_pkgver}"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cp -r "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
