# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

pkgname=pacman-hook-systemd-preset
pkgver=1
pkgrel=1
pkgdesc="Apply systemd presets after package installations and upgrades"
arch=("any")
license=("0BSD")
depends=('systemd')
source=("70-systemd-preset.hook")
b2sums=('61312c3fc2b639a4bb304bc5018b8ee11e3e373cc86b724695e18a48e145eaddfd1d1fab18cd460d36ba745352b0d1d37a2141b2c8f350d6515c8ef512af8fdb')

package() {
    install -Dm0644 -t "${pkgdir}/usr/share/libalpm/hooks/" 70-systemd-preset.hook
}
