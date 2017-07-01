# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=inox-bin
pkgver=59.0.3071.115
pkgrel=1
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google. (binary version)"
arch=('x86_64')
url="http://www.chromium.org/"
license=('BSD')
provides=('inox')
conflicts=('inox')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'perl-file-basedir'
         'pciutils' 'desktop-file-utils' 'hicolor-icon-theme'
         'flac' 'harfbuzz-icu' 'libjpeg' 'libpng' 'libwebp' 'libxml2' 'libxslt' 'snappy' 'minizip' 're2')
optdepends=('pepper-flash: support for Flash content'
            'kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
options=('!strip')
source=(https://github.com/gcarq/inox-patchset/releases/download/$pkgver/inox-$pkgver-1-$arch.pkg.tar.xz)
sha256sums=('93fc9a7587b2da0f2e20a3534631b77aeceea0ece2401b504339dade5b1e1b54')

package() {
  tar xJvf ${srcdir}/inox-${pkgver}-1-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
