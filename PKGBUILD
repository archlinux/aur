# Maintainer: AuroraNasa
pkgname=volume-knob-control-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A lightweight volume knob controller with device switching(And Brightness)."
arch=('x86_64' 'aarch64')
url="https://github.com/Aurora-Nasa-1/volume-control"
license=('MIT')
depends=('pipewire' 'libevdev' 'ddcutil')
source_x86_64=("$url/releases/download/v$pkgver/volume-knob-control_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/volume-knob-control" "${pkgdir}/usr/bin/volume-knob-control"
}