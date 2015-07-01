# Maintainer: XZS <d.f.fischer at web dot de>
# Contributor: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-ater-red
pkgver=0.1
pkgrel=1
epoch=2
pkgdesc="Ater Red cursor theme."
arch=(any)
url="http://xfce-look.org/content/show.php/ATER+Red+Mouse+Theme?content=108211"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/108211-ATER-Red-Mouse-Theme.tar.gz")
md5sums=('b88bca7024717eff04008cc2be6fd50c')

package() {
	cd ATER-Red-Mouse-Theme
  local destdir="$pkgdir/usr/share/icons/aterred"
	install -d "$destdir"
  mv cursors index.theme "$destdir"
}
