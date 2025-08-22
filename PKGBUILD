# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=139.0.7258.138
pkgrel=1
pkgdesc="A web browser built for speed, simplicity, and security, with patches for Omarchy (binary package)"
arch=('x86_64')
url="https://www.chromium.org/Home"
license=('BSD-3-Clause')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
provides=('chromium')
conflicts=('chromium' 'omarchy-chromium')
source=("https://github.com/omacom-io/omarchy-chromium/releases/download/v139.0.7258.138-1/omarchy-chromium-139.0.7258.138-1-x86_64.pkg.tar.zst")
sha256sums=('4acb5e7464f36d9cd549ed1495afd5c358cdb48cf7a77cc1a20cc42d0a49e89e')

package() {
    cd "$srcdir"
    
    # Extract the package
    tar -xf "omarchy-chromium-139.0.7258.138-1-x86_64.pkg.tar.zst"
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
