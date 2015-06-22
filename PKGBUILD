# Maintainer: Michael Egger <gcarq@archlinux.info>

pkgname=inox-bin
pkgver=43.0.2357.125
pkgrel=3
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google. (binary version)"
arch=('x86_64')
url="http://www.chromium.org/"
license=('BSD')
provides=('inox')
conflicts=('inox')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss' 'icu'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'speech-dispatcher' 'pciutils' 'libpulse' 'harfbuzz' 'libsecret'
         'libvpx' 'perl' 'perl-file-basedir' 'desktop-file-utils'
         'hicolor-icon-theme')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kdeutils-kwalletmanager: for storing passwords in KWallet')
options=('!strip')
source=(inox-bin.tar.xz::https://bintray.com/artifact/download/gcarq/generic/inox-$pkgver-$pkgrel-$arch.pkg.tar.xz)
sha256sums=('7a8b5cecc81959e30a2c34984cdeaf6794e3a4adb14f987fe3a454a48d1d164c')

package() {
  tar xJvf ${srcdir}/inox-bin.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
