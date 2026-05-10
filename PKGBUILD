# Maintainer: NullMaker <divided@hyprland>
pkgname=vrc-py
pkgver=1.0.1
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
sha256sums=('aad47a118bf4780970b10f420386dfa53fe1e60cc0701841d718468b54606799')

package() {
    install -Dm755 "${srcdir}/vrc.py" "${pkgdir}/usr/bin/vrc-py"
}
