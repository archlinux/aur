# Maintainer: Pedro Henrique <pedro00dk@gmail.com>
pkgname=nvidia-exec
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="A script to run programs nvidia optimus setups with power management"
arch=("x86_64")
url="https://github.com/pedro00dk/nvidia-exec#readme"
license=('GPL')
groups=()
depends=('nvidia' 'lshw' 'jq')
makedepends=()
checkdepends=()
optdepends=()
provides=($_pkgname)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/pedro00dk/nvidia-exec)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
    cd "$pkgname"
    install -Dm 755 nvx "$pkgdir/usr/bin/nvx"
    install -Dm 644 nvx.service "$pkgdir/etc/systemd/system/nvx.service"
    install -Dm 644 modprobe.conf "$pkgdir/usr/lib/modprobe.d/nvx.conf"
}
