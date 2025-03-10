# Maintainer: taotieren <admin@taotieren.com>

pkgbase=alimama-shuheiti
pkgname=({ttf,otf,woff,woff2}-$pkgbase)
pkgver=1.0.0
pkgrel=4
pkgdesc="阿里妈妈数黑体 AlimamaShuHeiTi"
url="https://www.alibabafonts.com/#/more"
makedepends=(libarchive)
license=("LicenseRef-Custom")
arch=(any)
source=("$pkgbase-$pkgver.zip::https://fonts.alibabadesign.com/AlimamaShuHeiTi/AlimamaShuHeiTi-Bold.zip")
sha256sums=('06f162d6802ab6e41b4f0e79abe90e084691ad480d5247d793f60167da4b9180')

package_ttf-alimama-shuheiti() {
    pkgdesc+="(ttf)"
    install -dm755 "$pkgdir/usr/share/fonts/TTF" \
        "$pkgdir/usr/share/licenses/${pkgname}"

    cd ${srcdir}/AlimamaShuHeiTi-bold
    install -m644 AlimamaShuHeiTi*.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 ${srcdir}/阿里妈妈数黑体版权声明.txt "$pkgdir/usr/share/licenses/${pkgname}/"
}

package_otf-alimama-shuheiti() {
    pkgdesc+="(otf)"
    install -dm755 "$pkgdir/usr/share/fonts/OTF" \
        "$pkgdir/usr/share/licenses/${pkgname}"

    cd ${srcdir}/AlimamaShuHeiTi-bold
    install -m644 AlimamaShuHeiTi*.otf "$pkgdir/usr/share/fonts/OTF/"
    install -m644 ${srcdir}/阿里妈妈数黑体版权声明.txt "$pkgdir/usr/share/licenses/${pkgname}/"
}

package_woff-alimama-shuheiti() {
    pkgdesc+="(woff)"
    install -dm755 "$pkgdir/usr/share/fonts/WOFF" \
        "$pkgdir/usr/share/licenses/${pkgname}"

    cd ${srcdir}/AlimamaShuHeiTi-bold
    install -m644 AlimamaShuHeiTi*.woff "$pkgdir/usr/share/fonts/WOFF/"
    install -m644 ${srcdir}/阿里妈妈数黑体版权声明.txt "$pkgdir/usr/share/licenses/${pkgname}/"
}

package_woff2-alimama-shuheiti() {
    pkgdesc+="(woff2)"
    install -dm755 "$pkgdir/usr/share/fonts/WOFF2" \
        "$pkgdir/usr/share/licenses/${pkgname}"

    cd ${srcdir}/AlimamaShuHeiTi-bold
    install -m644 AlimamaShuHeiTi*.woff2 "$pkgdir/usr/share/fonts/WOFF2/"
    install -m644 ${srcdir}/阿里妈妈数黑体版权声明.txt "$pkgdir/usr/share/licenses/${pkgname}/"
}
