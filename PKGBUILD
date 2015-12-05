# Maintainer: Michael Egger <gcarq@archlinux.info>

pkgname=inox-bin
pkgver=47.0.2526.73
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
source=(https://bintray.com/artifact/download/gcarq/generic/$pkgname-$pkgver-$pkgrel-$arch.pkg.tar.xz)
sha256sums=('697c25c23d7842be2d03896b6b2afb308f4f0dead374d5f38ce4ac31a326374d')

package() {
  tar xJvf ${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
