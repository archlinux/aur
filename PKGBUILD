# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>

pkgname=putty-freedesktop
pkgver=3
pkgrel=1
pkgdesc="Icon and .desktop file for Putty"
arch=('any')
license=('MIT')
url='http://www.chiark.greenend.org.uk/~sgtatham/putty/'
depends=('putty')
install='putty-freedesktop.install'
source=('putty.desktop' 'putty.png' 'putty.xpm')
sha256sums=('d33543cfd081f9a9fef3f5de0663b92142312d3d345faa559a771c7ef60dca69'
            '50cd4712011ea5124fc999298e1ccb51e10ba4f6448e434dc5e46b80c6d9b18a'
            'd65139883171ed0119d9778ff4a89e6a8151a5ae97fcf8dc7cafb59df424377f')

package() {
  install -Dm644 putty.desktop \
             "${pkgdir}/usr/share/applications/putty.desktop"
  install -Dm644 putty.png \
             "${pkgdir}/usr/share/pixmaps/putty.png"
  install -m644  putty.xpm \
             "${pkgdir}/usr/share/pixmaps/putty.xpm"
}
