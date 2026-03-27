# Maintainer: alsogamer <me@alsogamer.com>
pkgname=mpv-manager-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='MPV media player installer and manager with Web UI, TUI, and CLI modes (precompiled binary)'
arch=('x86_64' 'aarch64')
url='https://gitgud.io/mike/mpv-manager'
license=('MIT')
provides=('mpv-manager')
conflicts=('mpv-manager')
source=("LICENSE::https://gitgud.io/mike/mpv-manager/-/raw/v${pkgver}/LICENSE")
source_x86_64=("mpv-manager-${pkgver}-x86_64::https://gitgud.io/api/v4/projects/45219/packages/generic/mpv-manager/v${pkgver}/mpv-manager-linux-amd64")
source_aarch64=("mpv-manager-${pkgver}-aarch64::https://gitgud.io/api/v4/projects/45219/packages/generic/mpv-manager/v${pkgver}/mpv-manager-linux-arm64")
sha256sums=('fd564cfbdcfd3279f4881d6c29233193cb6cf59ae42c5c91d649ea2da56eeae7')
sha256sums_x86_64=('f634bf7afae840317a58000b7fa9e0fa1efc6bac7b0b30e1e82a295ee6cfb828')
sha256sums_aarch64=('cc487dd193133e7b7968545778ea8f4ec88d6631c1a4cb71e97b461efc53e46c')

package() {
    install -Dm755 "mpv-manager-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mpv-manager"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
