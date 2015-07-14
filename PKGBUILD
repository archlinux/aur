# Maintainer: Jonathan Biegert <azrdev@googlemail.com>

pkgname=p54-firmware
pkgver=1
pkgrel=1
pkgdesc="Firmware files for p54 driver"
arch=(any)
url="https://wireless.wiki.kernel.org/en/users/Drivers/p54"
license=('unknown')
depends=('linux>=2.6.29')
source=(https://daemonizer.de/prism54/prism54-fw/fw-softmac/2.13.25.0.arm
        https://daemonizer.de/prism54/prism54-fw/fw-usb/2.13.1.0.lm86.arm
        https://daemonizer.de/prism54/prism54-fw/fw-usb/2.13.25.0.lm87.arm
        https://daemonizer.de/prism54/prism54-fw/stlc4560/2.19.0.0.a.14.arm)
sha256sums=('3256a190f2b6853b396b2a1eefc01d194c865a4382ea2368fb3c931c16abca61'
            '40c4a2bc94b0af65d81cf6467b2e22fe029d55827ba100ff17c4974a2a377d0e'
            '4f4f5c523d7eab58f98d3f334d9adf1e626c2fde31b32347f5cede75fb92ad60'
            '4ec8da3c5e846a33790e2c7eb8ea4c3d0ecf901de8edf899fd2686ac83eebd4e')

package() {
    install -Dm0644 2.13.25.0.arm $pkgdir/lib/firmware/isl3886pci
    install -Dm0644 2.13.1.0.lm86.arm $pkgdir/lib/firmware/isl3886usb
    install -Dm0644 2.13.25.0.lm87.arm $pkgdir/lib/firmware/isl3887usb
    install -Dm0644 2.19.0.0.a.14.arm $pkgdir/lib/firmware/3826.arm
}

