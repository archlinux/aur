# Maintainer: NullMaker <divided-linux>
pkgname=vrc-py-dev
pkgver=1.0dev
pkgrel=1
pkgdesc="NVIDIA VRChat OSC HUD for Arch (Dev Build)"
arch=('any')
url="aur.archlinux.org/packages/vrc-py-dev" # Page
license=('MIT')
depends=('python' 'python-requests' 'playerctl' 'nvidia-utils')
source=('vr.py')
sha256sums=('4a3e419a72efe445d0ffa2184962560e56054e8a644980fa8a2a954d860dbb99')

package() {
    # Install the script
    install -Dm755 "${srcdir}/vr.py" "${pkgdir}/usr/bin/vrc-py-dev"
}
