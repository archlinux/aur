# Maintainer: Kalle Lindqvist <kalle.lindqvist@mykolab.com>
pkgname=gnome-shell-extension-sound-output-device-chooser
pkgver=25
pkgrel=1
pkgdesc="Sound Input & Output Device Chooser."
arch=('any')
url="https://github.com/kgshank/gse-sound-output-device-chooser"
license=('GPL')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.zip::https://extensions.gnome.org/extension-data/sound-output-device-chooserkgshank.net.v25.shell-extension.zip")
md5sums=("c92eb48bf836f2b01a1ed66a867ac688")

package() {
    _uuid="sound-output-device-chooser@kgshank.net"

    cd "${srcdir}"
    rm "${pkgname}-${pkgver}.zip"
    chmod -R 755 *

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cp -r * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}
