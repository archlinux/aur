pkgname=mkinitcpio-sd-encrypt-opensc-workaround
pkgver=0.1
pkgrel=1
pkgdesc='Install fixed sd-encrypt-opensc script from not-yet-released mkinitcpio version. For now use sd-encrypt-opensc-fixed in your mkinitcpio.conf instead of sd-encrypt-opensc.'
depends=('mkinitcpio')
arch=('any')
source=('https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio/-/raw/c91cd7c14c3244c9f088aea734d9662bbc3000d5/install/sd-encrypt-opensc')
sha256sums=('886fd191a7257eb34dbc05fa5c307879e6dfaf359577577a789967533564a5ae')

package() {
    install -D -m644 "sd-encrypt-opensc" "$pkgdir/usr/lib/initcpio/install/sd-encrypt-opensc-fixed"
}
