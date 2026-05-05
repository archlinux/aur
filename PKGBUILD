# Maintainer: crisxdwars <https://github.com/crisxdwars>
pkgname=lens-shot
pkgver=1.0.0
pkgrel=1
pkgdesc="Select a screen region and instantly open it in Google Lens using Chromium (Wayland)"
arch=('any')
url="https://github.com/crisxdwars/lens-shot"
license=('MIT')
depends=('grim' 'slurp' 'wl-clipboard' 'python' 'python-requests')
source=("lens-shot")
sha256sums=('SKIP')

package() {
    # Installs the file directly to /usr/bin/, makes it executable (755), 
    # and ensures pacman keeps complete lifecycle ownership of the binary.
    install -Dm755 "${srcdir}/lens-shot" "${pkgdir}/usr/bin/lens-shot"
}
