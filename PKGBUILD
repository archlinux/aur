# Maintainer: Dmitriy Q 

pkgname=gtk-meshtastic-client-bin
_pkgname=org.kop316.meshtastic
pkgver=1.4
pkgrel=6

pkgdesc="An unofficial client for Meshtastic devices in GTK4/Libadwaita."
arch=("x86_64")
url="https://wiki.postmarketos.org/wiki/Meshtastic"
license=("GPLv3")
categories=("network")

depends=("adwaita-icon-theme" "meshtastic-python" "python-pyqrcode" "gtk4" "pango" "libshumate" "python3" "python-dotmap" "python-gobject" "libgirepository")

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("http://ftp.ru.debian.org/debian/pool/main/g/${pkgname%-bin}/${pkgname%-bin}_${pkgver}-1_all.deb")
sha256sums=('71c8b8c955f6c879cf7d53186bfe029c0b984b3ed2bcc65fd6cd5e1eb00f37ec')

package(){
    bsdtar xzf data.tar.xz -C "${srcdir}"
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}
