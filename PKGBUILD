# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=gearlever-bin
pkgver=4.6.2
pkgrel=1
pkgdesc="Manage AppImages with ease (prebuilt)"
arch=('any')
url="https://gearlever.mijorus.it"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glib2' 'dconf' 'hicolor-icon-theme' 'python'
         'python-gobject' 'python-dbus' 'python-requests' 'python-pyxdg'
         'python-ftputil' 'python-desktop-entry-lib'
         '7zip' 'binutils' 'squashfs-tools' 'fuse2')
optdepends=('dwarfs: extract AppImages that use a DwarFS filesystem'
            'libxml2-legacy: required by the LibreOffice AppImage')
provides=('gearlever')
conflicts=('gearlever')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('319841a5dffd942b6f3b86822ac4d9d52a5b4ee559ea03ee5c2a6318a5161546')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
