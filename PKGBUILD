# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=veil-host-bin
pkgver=4.12
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

sha256sums_x86_64=('42ff9cab4d92fb983dd55cb31581fded572e8423d6bc312f0a94db8dd2b07e20'
  '82569a2dc2cead6610f07c4361bea5c857b366e084798f17ca75864dbaec0bb1')
sha256sums_aarch64=('8f945d6d51c20ed0c212e86801281c7808be735808949f823615c74b51f965b6'
  '82569a2dc2cead6610f07c4361bea5c857b366e084798f17ca75864dbaec0bb1')

package() {
  install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
  install -Dm644 "${srcdir}/config.lua" "${pkgdir}/usr/share/veil-host/config.lua"
}
