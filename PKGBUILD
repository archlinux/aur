# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=idle
pkgver=3.10.6
pkgrel=1
pkgdesc="Python Integrated Development and Learning Environment (desktop entry)"
arch=('any')
url="https://packages.debian.org/stable/python/idle"
license=("Python")
groups=()
depends=('python')
optdepends=()
provides=()
conflicts=()
replaces=('idle3'
          'python-idle')
source=('idle.desktop')
sha256sums=('8bbde2b6be32cd47bc4547fb941466fc89d13f2538a2c30594e5e21d83ca0800')


package() {
    install -Dm755 idle.desktop "${pkgdir}/usr/share/applications/idle.desktop"
    _icons_dir="${pkgdir}/usr/share/pixmaps"
    install -dm755 "${_icons_dir}"
    ln -s /usr/lib/python3.10/idlelib/Icons/idle_256.png "${_icons_dir}/idle.png"
}
