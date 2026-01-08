# Maintainer: TunarJamalov <jamalovtunar@gmail.com>
pkgname=pomofocus-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Pomo - Focus & Productivity Companion with Discord Integration"
arch=('x86_64')
url="https://pomofocus.online"
license=('ISC')
depends=('gtk3' 'libxss' 'nss' 'libdbusmenu-gtk3')
provides=('pomofocus')
conflicts=('pomofocus')

source=("https://pomofocus.online/PomoFocus-1.0.1.AppImage")
sha256sums=('006c565c5d414c6679260e15e4e902dedc80e3d1ec0ecdec0f709e4c02877522')

package() {
    install -Dm755 "${srcdir}/PomoFocus-1.0.1.AppImage" "${pkgdir}/usr/bin/pomofocus"
}
