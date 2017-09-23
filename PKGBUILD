# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=inox-bin
pkgver=61.0.3163.100
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
source=(https://github.com/gcarq/inox-patchset/releases/download/$pkgver/inox-$pkgver-1-$arch.pkg.tar.xz)
sha256sums=('9eced55947e42e45bf17c98f4e1c1c9a91db1bf5ad31817aa7a2e3d661aa38a0')

package() {
  tar xJvf ${srcdir}/inox-${pkgver}-1-${arch}.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
