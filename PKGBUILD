# Maintainer: P4ndaShi <p4ndab3y@proton.me>
pkgname=anizium-desktop-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Anizium için modern, sade ve Discord destekli Linux masaüstü uygulaması"
arch=('x86_64')
url="https://github.com/P4ndaShi/Anizium-Desktop-Linux"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libsecret')
provides=('anizium-desktop')
conflicts=('anizium-desktop')
options=('!strip' '!debug')
source=("anizium-desktop-bin-1.0.0.pacman::https://github.com/P4ndaShi/Anizium-Desktop-Linux/releases/download/v1.0.0/anizium-desktop-1.0.0.pacman")
sha256sums=('63fb6fcb832fbcd6f30adb1e1b65e3dc0d83f948df6cb203bd36872e5aba37ca')
package() {
    tar -xf "anizium-desktop-bin-1.0.0.pacman" -C "\$pkgdir/"
}
