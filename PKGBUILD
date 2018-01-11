# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=inox-bin
pkgver=63.0.3239.132
pkgrel=2
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google. (binary version)"
arch=('x86_64')
url="http://www.chromium.org/"
license=('BSD')
provides=('inox')
conflicts=('inox')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'perl-file-basedir'
         'pciutils' 'desktop-file-utils' 'hicolor-icon-theme'
         'flac' 'libjpeg' 'libwebp' 'freetype2' 'harfbuzz'
         'libxml2' 'libxslt' 'snappy' 'minizip' 're2' 'opus'
         'libxss' 'minizip' 'nss' 'json-glib')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: for hardware video acceleration with Intel GPUs'
            'libva-mesa-driver: for hardware video acceleration with AMD/ATI GPUs'
            'libva-vdpau-driver: for hardware video acceleration with NVIDIA GPUs')
options=('!strip')
source=(https://github.com/gcarq/inox-patchset/releases/download/$pkgver-$pkgrel/inox-$pkgver-$pkgrel-$arch.pkg.tar.xz)
sha256sums=('f57951b700ed4c52aafe5255ff94a1a7dceb6d4790af3f307bf25ef0c25e9e45')

package() {
  tar xJvf ${srcdir}/inox-${pkgver}-1-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
