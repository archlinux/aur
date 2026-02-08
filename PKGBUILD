# Maintainer: Your Name <your@email.com>
pkgname=volume-knob-control-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight volume knob controller with device switching."
arch=('x86_64' 'aarch64')
url="https://github.com/你的用户名/你的仓库名"
license=('MIT')
depends=('pipewire' 'libevdev')
source_x86_64=("$url/releases/download/v$pkgver/volume-knob-control_v${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/volume-control" "${pkgdir}/usr/bin/volume-control"
    install -Dm644 "${srcdir}/scripts/volume-control.service" "${pkgdir}/usr/lib/systemd/user/volume-control.service"
}