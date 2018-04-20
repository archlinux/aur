# Maintainer: yinflying <yinflying@foxmail.com>
pkgname=jps2rin
pkgver=2.0.0.146
pkgrel=1
pkgdesc="A converter from JPS format files(.jps) to RINEX(2/3) formats."
arch=('x86_64')
url="http://javad.com/jgnss/"
groups=('GNSS')
depends=('glibc')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("http://storage.javad.com/downloads/javadgnss/software/JPS2RIN/${pkgname}_linux64_${pkgver}.tar.gz")
noextract=()
md5sums=('f78876a80741d11261235a17b53204b9')

package() {
    install -Dm755 ${pkgname}_linux64 "$pkgdir/usr/bin/${pkgname}"
}
