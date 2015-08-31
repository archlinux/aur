# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# Needs to be merged with the main putty package. Icon will now show up in freedesktop.org compliant menus.

pkgname=putty-freedesktop
pkgver=1
pkgrel=1
pkgdesc="Icon and .desktop file for Putty"
arch=('any')
license=('MIT')
url=('http://www.chiark.greenend.org.uk/~sgtatham/putty/')
depends=('putty')
source=('putty.desktop' 'putty.png' 'putty.xpm')
sha256sums=('5b4f98201719d406caeb6f9c73ce723d90681cb00fa747593b24ca255e6ddd6c'
            '42c841aa8c6bcdbc44cc131dc1246f25559d82c426bab0a70133b286b1f3bb21'
            'e4d56c40fd0871868c59d0b83530ba9a9dca332f1d798248e739aee20fb5e831')

package() {
  install -Dm644 "${srcdir}/putty.desktop" "${pkgdir}/usr/share/applications/putty.desktop"
  install -Dm644 "${srcdir}/putty.png" "${pkgdir}/usr/share/pixmaps/putty.png"
  install -m644 "${srcdir}/putty.xpm" "${pkgdir}/usr/share/pixmaps/putty.xpm"
}
