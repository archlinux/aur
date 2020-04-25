# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Guinux <nuxgui@gmail.com>

pkgname=mhwd-nvidia
pkgver=0.1
pkgrel=1
pkgdesc="mhwd-nvidia pci id"
arch=("any")
url="https://garuda.org/"
license=('GPL2')
source=('nvidia-440xx.ids')
sha256sums=('SKIP')
provides=('mhwd-nvidia-440xx')
conflicts=('mhwd-nvidia-440xx')
package() {
    # Copy files
    mkdir -p ${pkgdir}/var/lib/mhwd/ids/pci
    install -m644 ${srcdir}/nvidia-440xx.ids ${pkgdir}/var/lib/mhwd/ids/pci/

}
