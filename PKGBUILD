# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=archlinux-iso
pkgver=2018.10.01
pkgrel=1
pkgdesc='The official installation ISO of Arch Linux.'
arch=('any')
url='https://www.archlinux.org/'
noextract=("archlinux-${pkgver}-x86_64.iso")
source=("http://www.gtlib.gatech.edu/pub/archlinux/iso/${pkgver}/archlinux-${pkgver}-x86_64.iso"
        "http://www.gtlib.gatech.edu/pub/archlinux/iso/${pkgver}/archlinux-${pkgver}-x86_64.iso.sig")
sha256sums=('9814b9afcc822f1f97ad4fb2ec811b373c00f409830ab47750e55246c1af5bc7'
            'SKIP')
validpgpkeys=('4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC')

package() {
    install -D -m 0644 "archlinux-${pkgver}-x86_64.iso" "${pkgdir}/opt/archlinux/archlinux-x86_64.iso"
}
