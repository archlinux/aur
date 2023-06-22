# Maintainer: <yann at leretaille.com>
pkgname=mglru-desktop-settings
pkgver=1.0
pkgrel=1
pkgdesc="Optimizes page reclaim for desktop environments to reduce janks and improve performance under memory pressure (requires kernel 6.1)"
license=('MIT')
arch=('any') 
depends=('systemd')

source=("mglru-desktop-settings.service" "mglru-desktop-settings.install")
sha256sums=('8c6ac56f422d86990d5a7ae9a2bfa6904ee74f71fab4f02b8808b947a33df673'
            '4dfe404bec07c3f77faf5a9e390036a95621fc08034d52faca41e86a10e29c74')

package() {
	install -Dm0644 -t "$pkgdir"/usr/lib/systemd/system/ mglru-desktop-settings.service
}

install=mglru-desktop-settings.install
