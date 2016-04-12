# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=inox-bin
pkgver=49.0.2623.110
pkgrel=2
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google. (binary version)"
arch=('x86_64')
url="http://www.chromium.org/"
license=('BSD')
provides=('inox')
conflicts=('inox')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss' 'icu'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'pciutils' 'libpulse' 'harfbuzz' 'libsecret'
         'perl' 'perl-file-basedir' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
options=('!strip')
source=(https://github.com/gcarq/inox-patchset/releases/download/$pkgver/inox-$pkgver-$pkgrel-$arch.pkg.tar.xz)
sha256sums=('0fd671a5f31d1f17ffaf15ba5aecc93364c8b9c5967d5f1e43abd5ec0d323c8f')

package() {
  tar xJvf ${srcdir}/inox-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:


