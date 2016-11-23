# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=inox-bin
pkgver=54.0.2840.100
pkgrel=1
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google. (binary version)"
arch=('x86_64')
url="http://www.chromium.org/"
license=('BSD')
provides=('inox')
conflicts=('inox')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss' 'libvpx'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'pciutils' 'libpulse' 'harfbuzz' 'libsecret'
         'perl' 'perl-file-basedir' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
options=('!strip')
source=(https://github.com/gcarq/inox-patchset/releases/download/$pkgver/inox-$pkgver-$pkgrel-$arch.pkg.tar.xz)
sha256sums=('2abf71686b3cdff7bb96314867ee7af2bb0bb00556e7f56d2959ab55dd2db13e')

package() {
  tar xJvf ${srcdir}/inox-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:


