pkgname=rescuezilla-iso
pkgver=2.6.1
pkgrel=1
pkgdesc="Rescuezilla live ISO (Clonezilla GUI)"
arch=('any')
url="https://github.com/rescuezilla/rescuezilla"
license=('custom')
options=('!strip')

source=("rescuezilla-${pkgver}.iso::https://github.com/rescuezilla/rescuezilla/releases/download/${pkgver}/rescuezilla-${pkgver}-64bit.oracular.iso")
noextract=("rescuezilla-${pkgver}.iso")
sha256sums=('SKIP')

package() {
    install -Dm644 "${srcdir}/rescuezilla-${pkgver}.iso" \
        "${pkgdir}/var/lib/libvirt/images/zRescuezilla.iso"
}
