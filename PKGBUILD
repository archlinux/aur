# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Guinux <nuxgui@gmail.com>

pkgname=mhwd-nvidia
pkgver=0.1
pkgrel=4
pkgdesc="mhwd-nvidia pci id"
arch=("any")
url="https://garudalinux.in/"
license=('GPL2')
source=('nvidia.ids')
sha256sums=('44ed1d791a64de33120d436fe082b02d660bf181e59cbb1f25d97004f267c007')
provides=('mhwd-nvidia')
package() {
    # Copy files
    mkdir -p ${pkgdir}/var/lib/mhwd/ids/pci
    install -m644 ${srcdir}/nvidia.ids ${pkgdir}/var/lib/mhwd/ids/pci/

}
