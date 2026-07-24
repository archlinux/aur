# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=gearlever-bin
pkgver=4.6.2
pkgrel=2
pkgdesc="Manage AppImages with ease (prebuilt)"
arch=('any')
url="https://gearlever.mijorus.it"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glib2' 'dconf' 'hicolor-icon-theme' 'python'
         'python-gobject' 'python-dbus' 'python-requests' 'python-pyxdg'
         '7zip' 'binutils' 'squashfs-tools' 'fuse2')
optdepends=('dwarfs: extract AppImages that use a DwarFS filesystem'
            'libxml2-legacy: required by the LibreOffice AppImage')
provides=('gearlever')
conflicts=('gearlever')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('225dd08d1fbdf33bb5979660737cee180f60b8cfa6477f1553025a6c2f5236a5')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
