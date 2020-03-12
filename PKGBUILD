# Maintainer: Kalle Lindqvist <kalle.lindqvist@mykolab.com>
pkgname=gnome-shell-extension-sound-output-device-chooser
pkgver=28
pkgrel=2
pkgdesc="Sound Input & Output Device Chooser."
arch=('any')
url="https://github.com/kgshank/gse-sound-output-device-chooser"
license=('GPL')
depends=('gnome-shell')
optdepends=('python: for new profile identification')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kgshank/gse-sound-output-device-chooser/archive/${pkgver}.tar.gz")
md5sums=("50dd52975f973a976aeee75e95d1206b")

package() {
    _uuid="sound-output-device-chooser@kgshank.net"

    cd "${srcdir}/gse-sound-output-device-chooser-${pkgver}"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cp -r "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
