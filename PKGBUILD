# Maintainer: sodahub-org <https://github.com/sodahub-org/sodam>
pkgname=sodam-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Native Qishui Music desktop client built with GPUI (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/sodahub-org/sodam'
license=('AGPL-3.0-or-later')
depends=('alsa-lib' 'dbus' 'fontconfig' 'freetype2' 'hicolor-icon-theme' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb')
provides=('sodam')
conflicts=('sodam')
options=('!strip' '!debug')
source_x86_64=("https://github.com/sodahub-org/sodam/releases/download/v0.4.1/sodam-0.4.1-1-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/sodahub-org/sodam/releases/download/v0.4.1/sodam-0.4.1-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('a756655eec943975cddff65d5e57c231d79d608cd02cbaa8441d2949673e7259')
sha256sums_aarch64=('272e64f4f2cbaabd44a96b9d553e9465395bff3171784cda565626ded214d979')

package() {
  bsdtar -xf "$srcdir/sodam-${pkgver}-1-${CARCH}.pkg.tar.zst" -C "$pkgdir" usr
}
