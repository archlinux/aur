# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=pacman-hook-cleanup-cache
pkgver=1
pkgrel=1
pkgdesc="Pacman hooks to cleanup cache."
url="https://build.opensuse.org/package/show/home:swsnr/${pkgname}"
arch=('any')
license=('MIT-0')
depends=(pacman-contrib)
source=(
	99-cleanup-cache-outdated.hook
	99-cleanup-cache-uninstalled.hook
)
sha256sums=('06d25d19250fb48565a08b2dfbbc48d19fdb28ed257cfda66bd6fd3b0f82d026'
            'c90f8ed684c7b3645ff1f3a1029dc224d5ba597b5b0e1e2e47a4ffc018af9193')

package() {
    install -Dpm644 -t "${pkgdir}/usr/share/libalpm/hooks" \
        99-cleanup-cache-outdated.hook \
        99-cleanup-cache-uninstalled.hook
}
