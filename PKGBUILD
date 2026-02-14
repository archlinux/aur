# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=dealve-bin
_pkgname=dealve
pkgver=1.0.1
pkgrel=2
pkgdesc='Delve into game deals from your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/kurama/dealve-tui'
license=('MIT' 'APACHE')
provides=('dealve')
conflicts=('dealve-git' 'dealve')
source_x86_64=("dealve::$url/releases/download/v$pkgver/dealve-linux-x86_64")
source_aarch64=("dealve::$url/releases/download/v$pkgver/dealve-linux-aarch64")
source=( "LICENSE-MIT::https://raw.githubusercontent.com/kurama/dealve-tui/refs/tags/v$pkgver/LICENSE-MIT"
    "LICENSE-APACHE::https://raw.githubusercontent.com/kurama/dealve-tui/refs/tags/v$pkgver/LICENSE-APACHE")
sha256sums=('55cf05201368eecb0f19bc0593896bc43b74c84f4edfa5c05e98d25cf15fea9e'
            'e78b5eea9f99899362002c7f2268c676558f83009d74aefde7666222eadb448d')
sha256sums_x86_64=('638e59100851e86e0a7e57e56bba837ff9462537b3dd48c599addb2a7e8e16cd')
sha256sums_aarch64=('f2981c397322569a32652aa9a492b42f37c634cfc71692cda8c172b15c1c95a9')

package() {
    install -Dm0755 'dealve' "$pkgdir/usr/bin/dealve"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
}

# vim: ts=4 sw=4 et:
