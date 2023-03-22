# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=systemd-suspend-modules
pkgver=1.2
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

sha256sums=('d847f2ea5a5ef63473bed0200d5c15e74b93ac8ec88fce811f80340701d18e67')
