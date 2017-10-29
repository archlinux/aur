# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=inox-bin
pkgver=62.0.3202.75
pkgrel=3
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google. (binary version)"
arch=('x86_64')
url="http://www.chromium.org/"
license=('BSD')
provides=('inox')
conflicts=('inox')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'perl-file-basedir'
         'pciutils' 'desktop-file-utils' 'hicolor-icon-theme'
         'flac' 'harfbuzz-icu' 'libjpeg' 'libpng' 'libwebp'
         'libxml2' 'libxslt' 'snappy' 'minizip' 're2' 'opus')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: for hardware video acceleration with Intel GPUs'
            'libva-mesa-driver: for hardware video acceleration with AMD/ATI GPUs'
            'libva-vdpau-driver: for hardware video acceleration with NVIDIA GPUs')
options=('!strip')
source=(https://github.com/gcarq/inox-patchset/releases/download/$pkgver-2/inox-$pkgver-2-$arch.pkg.tar.xz)
sha256sums=('65b7209dd1f413f6a598c5f6a3a51c7b4679d6f8833450241c9c656ad2a5e309')

package() {
  tar xJvf ${srcdir}/inox-${pkgver}-2-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
