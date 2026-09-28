# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=veil-host-bin
pkgver=3.2.3
pkgrel=1
pkgdesc="The Ultimate Desktop Environment for lightweight and free"
arch=('x86_64' 'aarch64')
url="https://github.com/viewerofall/veilTDC"
license=('MIT')
provides=('veil-host')
conflicts=('veil-host')

install=veil-host-bin.install

source_x86_64=("veil-host::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/veil-host-x86_64-unknown-linux-gnu"
  "config.lua::https://raw.githubusercontent.com/viewerofall/veilTDC/v${pkgver}/config.lua")
source_aarch64=("veil-host::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/veil-host-aarch64-unknown-linux-gnu"
  "config.lua::https://raw.githubusercontent.com/viewerofall/veilTDC/v${pkgver}/config.lua")

sha256sums_x86_64=('0a66d3a2e3646156b7c95c1c24321f2f93d27c7b184aca98b3d6ad47cb29a5d8'
  '8576b875703d2869e5c1a21d1fa0bed1029ceb252c21f8b8d6801ed77ee02c3d')
sha256sums_aarch64=('a29899d7fccd616848e64ad3a898ad8669cb684b82f366e83a0458adc3eaf09f'
  '8576b875703d2869e5c1a21d1fa0bed1029ceb252c21f8b8d6801ed77ee02c3d')

package() {
  install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
  install -Dm644 "${srcdir}/config.lua" "${pkgdir}/usr/share/veil-host/config.lua"
}
