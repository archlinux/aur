# Maintainer: Margot Prego <mopigames@proton.me>

pkgname=helios-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='Game stream host for Selene and Moonlight OS (prebuilt)'
arch=('x86_64')
url='https://github.com/moonlight-os/helios'
license=('GPL-3.0-only')
install=helios.install

depends=(
  'avahi' 'boost-libs' 'curl' 'gcc-libs' 'libayatana-appindicator' 'libcap'
  'libdrm' 'libevdev' 'libmfx' 'libnotify' 'libpulse' 'libva' 'libx11'
  'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'miniupnpc' 'msquic' 'numactl'
  'open-iscsi' 'openssl' 'opus' 'systemd-libs' 'udev' 'usbip' 'wayland' 'which'
)
optdepends=(
  'cuda: Nvidia GPU encoding support'
  'libva-mesa-driver: AMD GPU encoding support'
)
provides=('helios')
conflicts=('helios' 'helios-git')

source=("helios-${pkgver}-1-${CARCH}.pkg.tar.zst::https://github.com/moonlight-os/helios/releases/download/v${pkgver}/helios-${pkgver}-1-${CARCH}.pkg.tar.zst")
sha256sums=('8ae9f8359e676b88ce30d1fd93be7078362512d0ed8f503b9f1ecd512c2ded11')

package() {
  cp -a usr "$pkgdir/"
}
