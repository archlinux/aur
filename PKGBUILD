# Maintainer: yinflying <yinflying@foxmail.com>
pkgname=bnc-bin
pkgver=2.12.6
pkgrel=1
pkgdesc="The BKG Ntrip Client(BNC) is an multi-stream client designed for real-time GNSS applications."
arch=('x86_64')
url="http://www.rtklib.com/"
license=('GPL')
groups=('GNSS')
#depends=('glibc')
provides=("bnc")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://igs.bkg.bund.de/root_ftp/NTRIP/software/bnc-${pkgver}-debian8-64bit-static.zip" 
    "https://igs.bkg.bund.de/img/ntrip-logo.png"
    "bnc.desktop")
md5sums=('76f1ef2298ebbe11432575fa29d2e6f1'
    'cec39d8a485b402bccc2955f281db92d'
    'b14d15a36f293e8f64fe73b9618f7e69')

package() {
    install -Dm755 "$srcdir/bnc-${pkgver}-debian8-64bit-static/bnc-${pkgver}-debian8-64bit-static" "$pkgdir/usr/bin/bnc"
    install -Dm644 "${srcdir}/ntrip-logo.png" "${pkgdir}/usr/share/pixmaps/bnc.png"
    install -Dm644 "${srcdir}/bnc.desktop" "${pkgdir}/usr/share/applications/bnc.desktop"
}
