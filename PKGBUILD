# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=nepali-calendar-gs-extension
pkgver=10
pkgrel=1
pkgdesc="A gnome-shell extension for displaying the Nepali calendar in the top bar."
arch=('any')
url="https://github.com/PublisherName/nepali-calendar-gs-extension"
license=('GPL-3.0-only')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PublisherName/nepali-calendar-gs-extension/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('375001371da9e9c28e4b96dae2d140aeb2b43501b205f8f8119daa7d29379b2c')

package() {
  cd ${pkgname}-${pkgver}
  glib-compile-schemas ./nepali-calendar-gs-extension@subashghimire.info.np/schemas
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -r ${pkgname}@subashghimire.info.np "${pkgdir}/usr/share/gnome-shell/extensions/${pkgname}@subashghimire.info.np"
}
