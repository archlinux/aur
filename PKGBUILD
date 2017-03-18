# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >

_themeUrlId=1172793
_themeDownloadId=1489560936
_themename=aurora-nuevo
_themeurlfull=https://dl.opendesktop.org/api/files/download/id/1489560936/Aurora-Nuevo-Themes.tar.xz

pkgname=gtk-theme-${_themename}
pkgver=1
pkgrel=0
pkgdesc="Easy On The Eyes GTK 3.20 + Themes."
arch=('any')
url="https://www.gnome-look.org/p/${_themeUrlId}/"
license=('GPL')
depends=('gtk3>=3.20')
source=(https://dl.opendesktop.org/api/files/download/id/${_themeDownloadId}/Aurora-Nuevo-Themes.tar.xz)
sha256sums=('201f7b966282c8e97b738d615f748c89af6e305bd3c90b8bf7fd295e701f187c')

package() {
	cd "${srcdir}/Aurora-Nuevo-Themes"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
