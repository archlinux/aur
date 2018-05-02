# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=inox-bin
pkgver=66.0.3359.139
pkgrel=1
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google. (binary version)"
arch=('x86_64')
url="http://www.chromium.org/"
license=('BSD')
provides=('inox')
conflicts=('inox')
depends=('alsa-lib' 'dbus' 'desktop-file-utils' 'flac' 'fontconfig' 'freetype2'
         'gtk3' 'harfbuzz' 'hicolor-icon-theme' 'icu' 'json-glib' 'libcups'
         'libgcrypt' 'libjpeg' 'libpulse' 'libwebp' 'libxslt'
         'libxss' 'minizip' 'nss' 'opus' 'pciutils' 're2' 'snappy' 'systemd'
         'ttf-font' 'xdg-utils'
)
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: for hardware video acceleration with Intel GPUs'
            'libva-mesa-driver: for hardware video acceleration with AMD/ATI GPUs'
            'libva-vdpau-driver: for hardware video acceleration with NVIDIA GPUs')
options=('!strip')
source=(inox.pkg.tar.xz::https://github.com/gcarq/inox-patchset/releases/download/$pkgver/inox-$pkgver-$pkgrel-$arch.pkg.tar.xz)
sha256sums=('d9523fc47ce59691dd6aa7267c4ebab008d1c57e7961d53b21eca9ea061a3432')

package() {
  tar xJvf ${srcdir}/inox.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
