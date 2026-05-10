# Maintainer: NullMaker <divided@hyprland>
pkgname=vrc-py-uni
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal VRChat OSC HUD (NVIDIA/AMD support, Async Lyrics, Progress Bars)"
arch=('any')
url="https://aur.archlinux.org/packages/vrc-py"
license=('MIT')
depends=('python' 'playerctl' 'python-requests')
optdepends=('nvidia-utils: for NVIDIA GPU monitoring'
            'cmatrix: for --larplarplarpsahur mode')
source=("vrc.py")
sha256sums=('3ae612ef2e56da6d847b7bc2c569821250ac88e7d4ced84deaffb070e3c6eade')

package() {
    install -Dm755 "${srcdir}/vrc.py" "${pkgdir}/usr/bin/vrc-py-uni"
}
