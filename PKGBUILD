# Maintainer: Nuschl <packages@nuschl.eu>
pkgname=nuschl-bin
pkgver=0.3.0
pkgrel=1
_debrev=1
pkgdesc='Voice and text chat for Mumble servers'
arch=('x86_64')
url='https://github.com/nuschl-eu/nuschl'
license=('EUPL-1.2')
depends=('glibc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'pipewire' 'alsa-lib' 'bubblewrap' 'util-linux' 'desktop-file-utils' 'hicolor-icon-theme')
provides=('nuschl')
conflicts=('nuschl')
options=('!strip' '!debug')
source=("https://dl.nuschl.eu/apt/pool/main/n/nuschl/nuschl_${pkgver}-${_debrev}_amd64.deb"{,.sig})
sha256sums=('96c5a05cdaa3f4d84c835662618e0975826b3ab3d9bbc4da8f8c315a31f2d13b' 'SKIP')
validpgpkeys=('352A499A94135B39CDF0BC3C58F4332DD74FC329')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
}
