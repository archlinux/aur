# Maintainer: Alia_Atreides <mmurphy four zero nine six at gmail dot com>
pkgname=ps3mca-udev-rules
pkgver=1
pkgrel=1
pkgdesc='udev rule for the PS3 Memory Card Adapter'
arch=('any')
source=("60-ps3mca.rules")
install="$pkgname.install"
sha256sums=('ba91b198d3174d132aebf3712eaf3e53d0375c93cf25483ccb4d03029576d252')

package() {
    install -Dm644 "$srcdir/60-ps3mca.rules" \
        "$pkgdir/usr/lib/udev/rules.d/60-ps3mca.rules"
}
