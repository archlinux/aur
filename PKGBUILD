# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=veil-host-bin
pkgver=4.21
pkgrel=1
pkgdesc="The Ultimate Desktop Environment for lightweight and free"
arch=('x86_64' 'aarch64')
url="https://github.com/viewerofall/veilTDC"
license=('MIT')
provides=('veil-host')
conflicts=('veil-host')

install=veil-host-bin.install

source_x86_64=("veil-host::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/veil-host-x86_64-unknown-linux-gnu"
  "config.toml::https://raw.githubusercontent.com/viewerofall/veilTDC/v${pkgver}/config.toml")
source_aarch64=("veil-host::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/veil-host-aarch64-unknown-linux-gnu"
  "config.toml::https://raw.githubusercontent.com/viewerofall/veilTDC/v${pkgver}/config.toml")

sha256sums_x86_64=('19a5c79f8954c6e7aea422434f9122c40140f991fdd1a59f1419f5e1c96e1964'
  'be0b57d753a2e444bbaadafa0f421e0de6327f051acad5379091f65dd6519532')
sha256sums_aarch64=('21e3cdc0d31c0ef915443127522990cc588480f349990c16ef4177b8403cd36e'
  'be0b57d753a2e444bbaadafa0f421e0de6327f051acad5379091f65dd6519532')

package() {
  install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
  install -Dm644 "${srcdir}/config.toml" "${pkgdir}/usr/share/veil-host/config.toml"
}
