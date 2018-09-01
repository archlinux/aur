# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-glassified-theme
epoch=1
pkgver=20100327
pkgrel=1
pkgdesc="DockBarX Theme"
arch=('any')
url="https://www.gnome-look.org/p/1112514/"
license=('unknown')
depends=('dockbarx')
groups=('dockbarx-themes')
source=('Glassified.tar.gz::https://www.gnome-look.org/p/1112514/startdownload?file_id=1465383731&file_name=109283-glassified.tar.gz&file_type=application/x-gzip&file_size=13179&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownload%2Fid%2F1465383731%2Fs%2Fabfa77e357a6bbe29ff540edf5a983b6%2Ft%2F1535816378%2Fu%2F%2F109283-glassified.tar.gz')
noextract=('Glassified.tar.gz')
sha256sums=('9ad77dd97cbb4760f2684fb9d6738e02b77c94a6e2444e4d75920fc522a5efe8')

package () {
  install -D -m644 "${srcdir}"/Glassified.tar.gz "${pkgdir}"/usr/share/dockbarx/themes/Glassified.tar.gz
}
