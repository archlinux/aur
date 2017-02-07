# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=inox-bin
pkgver=56.0.2924.87
pkgrel=1
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google. (binary version)"
arch=('x86_64')
url="http://www.chromium.org/"
license=('BSD')
provides=('inox')
conflicts=('inox')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'ffmpeg' 'libevent' 'icu'
         'libxss' 'libexif' 'libjpeg' 'libpng' 'libgcrypt' 'ttf-font' 'systemd'
         'dbus' 'flac' 'snappy' 'libwebp' 'libxslt' 're2' 'minizip'
         'pciutils' 'libpulse' 'harfbuzz-icu' 'libsecret' 'libvpx'
         'perl' 'perl-file-basedir' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
options=('!strip')
source=(https://github.com/gcarq/inox-patchset/releases/download/$pkgver/inox-$pkgver-1-$arch.pkg.tar.xz)
sha256sums=('201f29bb4bb719af57f3f7a8d58ee020ce4d0ce2b94e3d0c25abb4ca0aca6de7')

package() {
  tar xJvf ${srcdir}/inox-${pkgver}-1-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
