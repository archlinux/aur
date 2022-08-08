# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=idle
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Python Integrated Development and Learning Environment (desktop entry)"
arch=('x86_64')
url="https://packages.debian.org/stable/python/idle"
license=("Python")
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('idle'
        'idle.desktop')
noextract=()
sha256sums=('f3ffb776c4e9dadcc7dde4205a7270dc7a3d1e22734cb5f173123db58d58e4c3'
            '8bbde2b6be32cd47bc4547fb941466fc89d13f2538a2c30594e5e21d83ca0800')
validpgpkeys=()


package() {
    install -Dm755 idle "${pkgdir}/usr/bin/idle"
    install -Dm644 idle.desktop "${pkgdir}/usr/share/applications/idle.desktop"
    install -dm644 "${pkgdir}/usr/share/icons/"
    ln -s /usr/lib/python3.10/idlelib/Icons/idle_256.png "${pkgdir}/usr/share/icons/idle.png"
}
