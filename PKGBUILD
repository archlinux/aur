# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=inox-bin
pkgver=58.0.3029.110
pkgrel=1
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google. (binary version)"
arch=('x86_64')
url="http://www.chromium.org/"
license=('BSD')
provides=('inox')
conflicts=('inox')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libexif' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'perl' 'perl-file-basedir'
         'pciutils' 'desktop-file-utils' 'hicolor-icon-theme'
         'flac' 'harfbuzz-icu' 'libjpeg' 'libpng' 'libwebp' 'libxml2' 'libxslt' 'snappy' 'minizip')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
options=('!strip')
source=(https://github.com/gcarq/inox-patchset/releases/download/$pkgver/inox-$pkgver-1-$arch.pkg.tar.xz)
sha256sums=('50bf01b4b550f37eabc14a2281345af929fc518c571ac7fc0a706b03126f5006')

package() {
  tar xJvf ${srcdir}/inox-${pkgver}-1-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
