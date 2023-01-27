# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=zoom-firejail
pkgver=0.1.7
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
            'aea3761bd540ebe71b350a1f7fd79683080d73a1c26373ad1f91a552f5c9319665cba4e1d3bc0267bfca3f8d37598ec5077797eec43561f5f7bcd3b583df4b2a')

package() {
    install -Dm755 zoom-firejail "$pkgdir"/usr/bin/zoom-firejail
    install -Dm644 ZoomFirejail.desktop "$pkgdir"/usr/share/applications/ZoomFirejail.desktop
}
