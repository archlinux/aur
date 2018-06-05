# Maintainer: Kalle Lindqvist <kalle.lindqvist@mykolab.com>
pkgname=gnome-shell-extension-sound-output-device-chooser
_gitname="gse-sound-output-device-chooser"
pkgver=16
pkgrel=1
pkgdesc="Sound Input & Output Device Chooser."
arch=('any')
url="https://github.com/kgshank/gse-sound-output-device-chooser"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
source=("git://github.com/kgshank/${_gitname}.git#commit=0bfc897445b22aff19bf8162b1688de071e15e7f")
md5sums=("SKIP")

package() {
    _uuid="sound-output-device-chooser@kgshank.net"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cp -r "${srcdir}/${_gitname}/${_uuid}/"* \
       "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
