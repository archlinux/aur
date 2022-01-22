# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gdm-settings
__pkgver='0.1.0-alpha'
pkgver=${__pkgver/-/.}
pkgrel=1
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-settings"
license=('GPL3')
depends=('libadwaita' 'glib2' 'python-gobject')
makedepends=('git')
backup=()
source=("${pkgname}-${__pkgver}.tar.gz"::"$url/archive/refs/tags/v${__pkgver}.tar.gz")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-${__pkgver}"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh --relative=no
}
