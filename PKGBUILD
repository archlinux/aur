# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=bazaar-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="App store for GNOME with a focus on flatpaks and Flathub (prebuilt)"
arch=('x86_64')
url="https://github.com/bazaar-org/bazaar"
license=('GPL-3.0-only')
depends=('appstream' 'cairo' 'dconf' 'flatpak' 'glib2' 'glycin' 'glycin-gtk4'
         'graphene' 'gtk4' 'gtksourceview5' 'json-glib' 'libadwaita' 'libdex'
         'libheif' 'libmalcontent' 'libproxy' 'libsecret' 'libsoup3' 'libxmlb'
         'libyaml' 'md4c' 'pango' 'webkitgtk-6.0' 'hicolor-icon-theme')
optdepends=('krunner-bazaar: krunner integration'
            'malcontent: parental controls')
provides=('bazaar')
conflicts=('bazaar')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('236a8b672a9a67de9a240450f527b119bb4cbdfa0533e49578589fe83638e3dc')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
