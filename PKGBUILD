pkgname=rescuezilla-iso
pkgver=2.6.2_resolte
pkgrel=1
pkgdesc="Clonezilla GUI"
arch=('x86_64')
url="https://github.com/rescuezilla/rescuezilla"
license=('custom')
options=('!strip')

source=("zRescuezilla.iso::https://github.com/rescuezilla/rescuezilla/releases/download/2.6.2/rescuezilla-2.6.2-64bit.resolute.iso")
sha256sums=('SKIP')

package() {
    install -d "${pkgdir}/var/lib/libvirt/images"

    install -m644 "${srcdir}/zRescuezilla.iso" \
        "${pkgdir}/var/lib/libvirt/images/zRescuezilla.iso"
}
