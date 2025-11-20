# Maintainer: yinflying <yinflying@foxmail.com>
pkgname=jps2rin
pkgver=2.1.237
pkgrel=1
pkgdesc="A converter from JPS format files(.jps) to RINEX(2/3) formats."
arch=('x86_64')
url="http://javad.com/jgnss/"
groups=('GNSS')
depends=('glibc')
provides=("${pkgname}" "jps4rin")
conflicts=("${pkgname}" "jps4rin")
replaces=()
backup=()
options=()
install=
source=(
    "https://download.javad.com/software/JPS2RIN/${pkgname}_linux64_${pkgver}.tar.gz"
)
noextract=()
md5sums=(
    'd894f36afdc694af798af8eb8111d397'
)

package() {
    install -Dm755 ${pkgname}_linux64 "$pkgdir/usr/bin/${pkgname}"
}
