# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=gtk-theme-numix-sx
pkgver=20170424
pkgrel=7
pkgdesc="Gray variation of numix theme for Cinnamon/Gnome"
arch=('any')
url="https://www.gnome-look.org/p/1117412/"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-sx-beta')

source=("https://gitlab.com/danielhass/gtk-theme-numix-sx/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('f603e21c5aaf170b18dff97e27daf4edc6961ff5d9091cf69b258c2c44a8e647')

package() {
  install -d "$pkgdir/usr/share/themes"
  rm ${srcdir}/${pkgname}-${pkgver}.tar.bz2

  cp -r ${srcdir}/${pkgname}-${pkgver}/* "$pkgdir/usr/share/themes/"
}
