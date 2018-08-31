# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-shinybar-theme
pkgver=1.3.1
pkgrel=3
pkgdesc="Windows 7-like theme for DockBarX"
arch=('any')
url="https://www.deviantart.com/levviathor/art/Shinybar1-3-1-for-DockbarX-135875506"
license=('CCPL:cc-by-nc-sa-3.0')
depends=('dockbarx')
groups=('dockbarx-themes')
source=('https://orig00.deviantart.net/19aa/f/2010/165/2/9/shinybar1_3_1_for_dockbarx_by_levviathor.zip')
sha256sums=('6521ee666a529df2e5fda591e2ee3a5c8b532c6ff5b5467523b45b594d4bb01d')

package () {
  cd "${srcdir}"/Shinybar"${pkgver}"_deviantart

  mkdir -p "${pkgdir}"/usr/share/dockbarx/themes
  install -Dm644 shinybar_13_horiz.tar.gz "${pkgdir}"/usr/share/dockbarx/themes/
  install -Dm644 shinybar_13_vert.tar.gz "${pkgdir}"/usr/share/dockbarx/themes/
  install -Dm644 README_shinybar.txt "${pkgdir}"/usr/share/dockbarx/
}
