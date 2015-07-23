# Maintainer: Michael Egger <gcarq@archlinux.info>

pkgname=inox-bin
pkgver=44.0.2403.89
pkgrel=1
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
source=(inox-bin.tar.xz::https://bintray.com/artifact/download/gcarq/generic/$pkgname-$pkgver-$pkgrel-$arch.pkg.tar.xz)
sha256sums=('291ba8d66ba56993c537c08c9ca6690677feb6a00c482b94d7c509abffb43577')

package() {
  tar xJvf ${srcdir}/inox-bin.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
