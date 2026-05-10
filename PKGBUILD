# Maintainer: NullMaker <divided@hyprland>
pkgname=vrc-py
pkgver=1.0.0
pkgrel=1
pkgdesc="Advanced VRChat OSC HUD with synced lyrics, system stats, and progress bars"
arch=('any')
url="https://aur.archlinux.org/packages/vrc-py" # the badingle dongle
license=('MIT')
# Added python-requests here so the lyrics engine doesn't explode
depends=('python' 'playerctl' 'python-requests') 
optdepends=('nvidia-utils: for GPU monitoring support'
            'cmatrix: for --larplarplarpsahur mode')
source=("vrc.py") 
sha256sums=('de420cb38c384ef9f4c719ad63b675ac9524498c862b960e83320b05f8435908')

package() {
    install -Dm755 "${srcdir}/vrc.py" "${pkgdir}/usr/bin/vrc-py"
}
