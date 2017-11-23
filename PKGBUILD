# Maintainer: Alex Tokarev <aleksator at gmail>
pkgname=xcursor-arch-cursor-complete
pkgver=23.11.2017
pkgrel=1
pkgdesc="Expansion of Arch Cursor Simple theme that keeps the best and modifies the rest."
arch=('any')
url="https://github.com/aleksator/arch-cursor-complete"
license=('custom:cc-by-4.0')
source=("https://github.com/aleksator/arch-cursor-complete/releases/download/23.11.2017/ArchCursorComplete.tar.gz")
md5sums=('bc8fbd4467217d106d1fd143e7dbfa4b')

package() {
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -dr ArchCursorComplete "${pkgdir}/usr/share/icons"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
