pkgname=rescuezilla-iso

pkgver=2.6.1_oracular

pkgrel=1

pkgdesc="Clonezilla GUI"

arch=('x86_64')

url="https://github.com/rescuezilla/rescuezilla"

license=('custom')

options=('!strip')

source=("zRescuezilla.iso::https://github.com/rescuezilla/rescuezilla/releases/download/2.6.1/rescuezilla-2.6.1-64bit.oracular.iso")

sha256sums=('SKIP')

package() {

    install -Dm644 "${srcdir}/zRescuezilla.iso" \\

        "${pkgdir}/var/lib/libvirt/images/zRescuezilla.iso"

}
