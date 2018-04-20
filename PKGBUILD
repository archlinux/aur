# Maintainer: yinflying <yinflying@foxmail.com>
pkgname=rnxcmp-bin
pkgver=4.0.7
pkgrel=1
pkgdesc="Compression/restoration of RINEX observation files developed by Y. Hatanaka of GSI"
arch=('x86_64')
url="http://terras.gsi.go.jp/ja/crx2rnx.html"
groups=('GNSS')
depends=('glibc' 'tcsh')
provides=('CRX2RNX' 'CRZ2RNX' 'RNX2CRX' 'RNX2CRZ')
conflicts=('rnxcmp')
replaces=()
backup=()
options=()
install=
source=("http://terras.gsi.go.jp/ja/crx2rnx/RNXCMP_${pkgver}_Linux_x86_64bit.tar.gz")
noextract=()
md5sums=('6d03ff7e00f81bd0eaffd65d3e0ce8d0')

package() {
    cd RNXCMP_4.0.7_Linux_x86_64bit/bin
    install -Dm755 CRX2RNX "${pkgdir}/usr/bin/CRX2RNX"
    install -Dm755 CRZ2RNX "${pkgdir}/usr/bin/CRZ2RNX"
    install -Dm755 RNX2CRX "${pkgdir}/usr/bin/RNX2CRX"
    install -Dm755 RNX2CRZ "${pkgdir}/usr/bin/RNX2CRZ"
}
