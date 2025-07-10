# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=minc-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="MicroShift in Container"
arch=("any")
url="https://github.com/minc-org/minc"
license=("GPL-3.0-only")
depends=(
    'podman'
)
source=("https://github.com/minc-org/minc/releases/download/v$pkgver/minc_linux_amd64")
b2sums=('e9534e9239cd581db289a185f7330cadc614d719afa12ce626b297acf49b00fc37e65d48e65e1f944364f2e530b181929e1749f97bf6cdde1819850c13ac8927')

package() {
    install -Dm755 "minc_linux_amd64" "${pkgdir}/usr/bin/minc"
}
