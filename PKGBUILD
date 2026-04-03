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
sha256sums=('79bc59a1c3a28ec60362ec96e3f6e1e11cc095fbc9c38033c930eb794353d7d0')
package() {
    tar -xf "anizium-desktop-bin-1.0.0.pacman" -C "\$pkgdir/"
}
