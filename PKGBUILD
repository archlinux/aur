# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-shinybar-theme
pkgver=1.3.1
pkgrel=2
pkgdesc="Windows 7-like theme for DockBarX"
arch=('any')
url="http://levviathor.deviantart.com/art/Shinybar1-3-for-DockbarX-135875506"
license=('cc-by-sa')
depends=('dockbarx')
groups=('dockbarx-themes')
source=('http://fc05.deviantart.net/fs71/f/2010/165/2/9/Shinybar1_3_1_for_DockbarX_by_Levviathor.zip')
#DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')

package () {
  cd ${srcdir}/Shinybar${pkgver}_deviantart

  mkdir -p ${pkgdir}/usr/share/dockbarx/themes
  install -Dm644 shinybar_13_horiz.tar.gz ${pkgdir}/usr/share/dockbarx/themes/
  install -Dm644 shinybar_13_vert.tar.gz ${pkgdir}/usr/share/dockbarx/themes/
  install -Dm644 README_shinybar.txt ${pkgdir}/usr/share/dockbarx/
}

md5sums=('7e462d64034fe68d98ed6fabd181a2ac')
