# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=systemd-suspend-modules
pkgver=1.1
pkgrel=1
pkgdesc="Reload modules on suspend/hibernate with systemd"
arch=('any')
url="https://aur.archlinux.org/packages/systemd-suspend-modules"
license=('GPL')
depends=('bash' 'systemd')
backup=('etc/suspend-modules.conf')
source=("suspend-modules")

package() {
    # Install files
    install -Dm755 "${srcdir}/suspend-modules" "${pkgdir}/usr/lib/systemd/system-sleep/suspend-modules"
    mkdir ${pkgdir}/etc/
    touch ${pkgdir}/etc/suspend-modules.conf
}

sha256sums=('f71db2eb6b720f5049df9e8ed69e1e455704b75b70588bbade762a1bc8e815ad')
