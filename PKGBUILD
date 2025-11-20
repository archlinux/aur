# Maintainer: yinflying <yinflying@foxmail.com>
pkgname=rnxcmp-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="Compression/restoration of RINEX observation files developed by Y. Hatanaka of GSI"
arch=('x86_64')
url="http://terras.gsi.go.jp/ja/crx2rnx.html"
groups=('GNSS')
depends=()
provides=('CRX2RNX' 'RNX2CRX')
conflicts=('rnxcmp')
replaces=()
backup=()
options=()
install=
source=("http://terras.gsi.go.jp/ja/crx2rnx/RNXCMP_${pkgver}_Linux_gcc_64bit.tar.gz")
noextract=()
md5sums=('e17760d79894d08663a878e09af64fa5')

package() {
    cd RNXCMP_${pkgver}_Linux_gcc_64bit/
    install -Dm755 CRX2RNX "${pkgdir}/usr/bin/CRX2RNX"
    install -Dm755 RNX2CRX "${pkgdir}/usr/bin/RNX2CRX"

}
