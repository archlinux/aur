# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Guinux <nuxgui@gmail.com>

pkgname=mhwd-nvidia
pkgver=0.1
pkgrel=3
pkgdesc="mhwd-nvidia pci id"
arch=("any")
url="https://garuda.org/"
license=('GPL2')
source=('nvidia-440xx.ids')
sha256sums=('44bfd99df2ea02e0ab8cc966a27f86fa12b9c21366ffa5ab6a6e2681608c9ae3')
provides=('mhwd-nvidia-440xx')
conflicts=('mhwd-nvidia-440xx')
package() {
    # Copy files
    mkdir -p ${pkgdir}/var/lib/mhwd/ids/pci
    install -m644 ${srcdir}/nvidia-440xx.ids ${pkgdir}/var/lib/mhwd/ids/pci/

}
