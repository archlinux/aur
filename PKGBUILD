# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=zoom-firejail
pkgver=0.1.6
pkgrel=1
pkgdesc=".desktop file for running Zoom in Firejail"
arch=('x86_64')
license=('MIT')
depends=('zoom' 'firejail')
optdepends=('xdg-utils')
install=zoom-firejail.install
source=('ZoomFirejail.desktop'
        'zoom-firejail')
sha512sums=('88342fd5847dd58c271ea9cb2ca7c4497fba00b3ea761a8ce630e1d072a7e39c426fffe62cc5fdb6c8516a33e70dd292109c41f7d3966fee7acb78b32c3a0e6a'
            'dafee2e2586e090c09bb039d5a9d9e6035fff19c67725226a550707ee4602562f7e2adafdab34454b664240c4b025f1e1e3763917dd1e1566309db002ccab48f')

package() {
    install -Dm755 zoom-firejail "$pkgdir"/usr/bin/zoom-firejail
    install -Dm644 ZoomFirejail.desktop "$pkgdir"/usr/share/applications/ZoomFirejail.desktop
}
