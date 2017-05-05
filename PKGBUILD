# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=secure-boot
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="secure-boot tool"
arch=(any)
url="https://github.com/gdamjan/secure-boot"
license=('GPL')
groups=()
depends=('efitools' 'sbsigntools' 'make' 'efibootmgr' 'util-linux' 'binutils' 'systemd')
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
source=(secure-boot secure-boot.hook)
noextract=()

package() {
    cd "${srcdir}"
    install -dm700 ${pkgdir}/etc/secure-boot
    install -Dm755 secure-boot ${pkgdir}/usr/bin/secure-boot
    install -Dm644 secure-boot.hook ${pkgdir}/etc/pacman.d/hooks/secure-boot.hook
}

md5sums=('ad7d694cb141f5437eec509a781f4b3d'
         '1313074db7ddeac0c115e44c7b16f218')
