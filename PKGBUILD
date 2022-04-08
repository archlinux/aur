# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Kalle Lindqvist <kalle.lindqvist@mykolab.com>
pkgname=gnome-shell-extension-sound-output-device-chooser
pkgver=42.42
_pkgver=42
pkgrel=1
pkgdesc="Sound Input & Output Device Chooser."
arch=('any')
url="https://github.com/kgshank/gse-sound-output-device-chooser"
license=('GPL')
conflicts=('gnome-shell-extension-sound-output-device-chooser-git')
depends=('gnome-shell')
optdepends=('python: for new profile identification')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kgshank/gse-sound-output-device-chooser/archive/${_pkgver}.tar.gz")
sha256sums=('74ae347899a1a8c42bbc2a791791453c56f88f84038f76e9df818bc2f27ab735')

package() {
    _uuid="sound-output-device-chooser@kgshank.net"

    cd "${srcdir}/gse-sound-output-device-chooser-${_pkgver}"

    install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    cp -r "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
