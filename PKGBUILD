# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=139.0.7258.66
pkgrel=6
pkgdesc="A web browser built for speed, simplicity, and security, with patches for Omarchy (binary package)"
arch=('x86_64')
url="https://www.chromium.org/Home"
license=('BSD-3-Clause')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
provides=('chromium')
conflicts=('chromium' 'omarchy-chromium')
source=("https://github.com/omacom-io/omarchy-chromium/releases/download/v139.0.7258.66-6/omarchy-chromium-139.0.7258.66-6-x86_64.pkg.tar.zst")
sha256sums=('366c32ff38a9a63c57c83d2297ef40767f8502da3fef98bdcfcdc3858e695c07')

package() {
    cd "$srcdir"
    
    # Extract the package
    tar -xf "omarchy-chromium-139.0.7258.66-6-x86_64.pkg.tar.zst"
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
