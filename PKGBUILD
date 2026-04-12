# Maintainer: alsogamer <me@alsogamer.com>
pkgname=mpv-manager-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='MPV media player installer and manager with Web UI, TUI, and CLI modes (precompiled binary)'
arch=('x86_64' 'aarch64')
url='https://gitgud.io/mike/mpv-manager'
license=('MIT')
provides=('mpv-manager')
conflicts=('mpv-manager')
optdepends=('mpv: media player managed and configured by this tool'
            'celluloid: GTK-based mpv frontend'
            'mpc-qt: Qt-based mpv frontend'
            'ffmpeg: additional media processing support'
            'flatpak: manage Flatpak versions of mpv and Celluloid')
source=("LICENSE::https://gitgud.io/mike/mpv-manager/-/raw/v${pkgver}/LICENSE")
source_x86_64=("mpv-manager-${pkgver}-x86_64::https://gitgud.io/api/v4/projects/45219/packages/generic/mpv-manager/v${pkgver}/mpv-manager-linux-amd64")
source_aarch64=("mpv-manager-${pkgver}-aarch64::https://gitgud.io/api/v4/projects/45219/packages/generic/mpv-manager/v${pkgver}/mpv-manager-linux-arm64")
sha256sums=('fd564cfbdcfd3279f4881d6c29233193cb6cf59ae42c5c91d649ea2da56eeae7')
sha256sums_x86_64=('648cf0b7b69d551791584d45ec169d628eb71723362ed9a5237d9d4baaca2f4f')
sha256sums_aarch64=('2582231f6a0bf1bd5f857db9ac0377c31d6906836b5b24f865a00c56ed70c610')

package() {
    install -Dm755 "mpv-manager-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mpv-manager"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
