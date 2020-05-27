# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=zoom-firejail
pkgver=0.1.5
pkgrel=1
pkgdesc=".desktop file for running Zoom in Firejail"
arch=('x86_64')
license=('MIT')
depends=('zoom' 'firejail')
optdepends=('xdg-utils')
install=zoom-firejail.install
source=('ZoomFirejail.desktop'
        'zoom-firejail')
sha512sums=('71af881f8bbb2daa7ee74b63a32ddb7e450ff6c83a0be4f054a9f4afa953f936ccb4c5f1812cae5d4317626fd222360eb10b0b48ec8876f70f74a0d804a9852a'
            'dafee2e2586e090c09bb039d5a9d9e6035fff19c67725226a550707ee4602562f7e2adafdab34454b664240c4b025f1e1e3763917dd1e1566309db002ccab48f')

package() {
    install -Dm755 zoom-firejail "$pkgdir"/usr/bin/zoom-firejail
    install -Dm644 ZoomFirejail.desktop "$pkgdir"/usr/share/applications/ZoomFirejail.desktop
}
