# Maintainer: Kevin Hanselman <kevin.hanselman@gmail.com>
pkgname=bakeware-bake-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Configure, compile and share systems, toolchains and linux firmware."
arch=('any')
url="http://bakeware.io"
license=('unknown')
groups=()
depends=('erlang-nox' 'squashfs-tools' 'fwup-git')
makedepends=()
provides=()
conflicts=('bake')
replaces=()
backup=()
options=()
install=
source=("https://s3.amazonaws.com/bakeware/bake/bake-${pkgver}.tar.gz")
noextract=()
md5sums=('b9abcb48a4d1c13e6004c37df486ec2c')

prepare() {
    mkdir -p ~/.bake
}

package() {
    install -m755 "${srcdir}/bake" -Dt "$pkgdir/usr/bin/"
}
