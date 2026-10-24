# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=veil-host-bin
pkgver=4.0.2
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

sha256sums_x86_64=('4f1136d51657ebd3ac140ada6bd77434e681a06fe3dbda0100c99376a36882d7'
  'd9ca7f4e2c572fcf3ebcfa1c161c7cc369716a6128fca41e1182acadd6f3456d')
sha256sums_aarch64=('9166192dd7fe8bdf9e27d15dad2ee1558ce6b2cfec0d55a3cafbb0209a868eca'
  'd9ca7f4e2c572fcf3ebcfa1c161c7cc369716a6128fca41e1182acadd6f3456d')

package() {
  install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
  install -Dm644 "${srcdir}/config.lua" "${pkgdir}/usr/share/veil-host/config.lua"
}
