# Maintainer: Alex Tokarev <aleksator at gmail>
pkgname=xcursor-arch-cursor-complete
pkgver=06.10.2018
pkgrel=1
pkgdesc="Expansion of Arch Cursor Simple theme that keeps the best and modifies the rest."
arch=('any')
url="https://github.com/aleksator/arch-cursor-complete"
license=('custom:cc-by-4.0')
source=("https://github.com/aleksator/arch-cursor-complete/releases/download/$pkgver/ArchCursorComplete.tar.gz")
md5sums=('9c3c3857ac1663c53a2f92ff5541efa7')

package() {
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -dr ArchCursorComplete "${pkgdir}/usr/share/icons"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
