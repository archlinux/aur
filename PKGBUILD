# Maintainer: Ferdinand Bachmann <ferdinand dot bachmann at yrlf dot at>

pkgname=shim-systemd-boot-update
pkgver=1.0.0
pkgrel=1
pkgdesc='Automatically update grubx64.efi with systemd-boot-update.service for shim'
arch=('any')
license=('GPL')
depends=('systemd')
source=('shim-systemd-boot-update.service'
        'shim-systemd-boot-update.sh')
sha256sums=('a5d21649fc0b7a2ebf6df617fe1eeffd64a97860963956b6259935e0d8c40340'
            'acf9c282d4fa43c310a7402028de5d4ae02ad523fe82c6b91d5641ddb2d228d1')

package() {
    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/lib/$pkgname/$pkgname.sh"
}
