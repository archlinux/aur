# Maintainer: Xiao Pan <xyz@flylightning.xyz>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=zoom-firejail
pkgver=0.9.74
pkgrel=2
pkgdesc="Desktop entry for running Zoom in Firejail"
arch=('x86_64')
license=('MIT')
depends=('zoom' 'firejail')
optdepends=('xdg-utils')
install=zoom-firejail.install
source=('ZoomFirejail.desktop'
        'zoom-firejail')
sha512sums=('c8113f7c41b8353bece697840a3bdb00d16bb5c0f20f46e97a8d304c17a52b79a30c42397a1126681b55ce67e7e273d06c1253b7596a8af17e40d6eeba63f992'
            'aea3761bd540ebe71b350a1f7fd79683080d73a1c26373ad1f91a552f5c9319665cba4e1d3bc0267bfca3f8d37598ec5077797eec43561f5f7bcd3b583df4b2a')

package() {
    install -Dm755 zoom-firejail "$pkgdir"/usr/bin/zoom-firejail
    install -Dm644 ZoomFirejail.desktop "$pkgdir"/usr/share/applications/ZoomFirejail.desktop
}
