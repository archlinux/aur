# Maintainer: Evan Anderson <evananderson@thelinuxman.us>
pkgname=vmware-hook
pkgver=1.0
pkgrel=2
pkgdesc="mkinitcpio hook to rebuild vmware kernel modules"
arch=('any')
license=('GPL3')
install=${pkgname}.install
source=('vmware')
sha256sums=('f78cc38547317a2bcfaa6f896c04e6ec2f4ef9c738317605b3b75c115a116948')

package() {
    install -D -m644 $srcdir/vmware $pkgdir/usr/lib/initcpio/install/vmware
}
