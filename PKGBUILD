# Maintainer: taotieren <admin@taotieren.com>

pkgbase=alimama-shuheiti
pkgname=({ttf,otf,woff,woff2}-$pkgbase)
pkgver=1.0.0
pkgrel=2
pkgdesc="阿里妈妈数黑体 AlimamaShuHeiTi"
url="https://fonts.alibabagroup.com/#/more"
makedepends=(libarchive)
license=("Custom")
arch=(any)
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlimamaShuHeiTi.zip")
sha256sums=('4a59fb4c30cd6e58581c1a73789264bbda65512e6329488ec4a41b5aaeafbd63')

package_ttf-alimama-shuheiti() {
    pkgdesc+="(ttf)"
    install -dm755 "$pkgdir/usr/share/fonts/TTF" \
                    "$pkgdir/usr/share/licenses/${pkgname}"

    cd ${srcdir}/AlimamaShuHeiTi
    install -m644 AlimamaShuHeiTi*/*.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 阿里妈妈数黑体版权声明.docx "$pkgdir/usr/share/licenses/${pkgname}/"
}

package_otf-alimama-shuheiti() {
    pkgdesc+="(otf)"
    install -dm755 "$pkgdir/usr/share/fonts/OTF" \
                    "$pkgdir/usr/share/licenses/${pkgname}"

    cd ${srcdir}/AlimamaShuHeiTi
    install -m644 AlimamaShuHeiTi*/*.otf "$pkgdir/usr/share/fonts/OTF/"
    install -m644 阿里妈妈数黑体版权声明.docx "$pkgdir/usr/share/licenses/${pkgname}/"
}

package_woff-alimama-shuheiti() {
    pkgdesc+="(woff)"
    install -dm755 "$pkgdir/usr/share/fonts/WOFF" \
                    "$pkgdir/usr/share/licenses/${pkgname}"

    cd ${srcdir}/AlimamaShuHeiTi
    install -m644 AlimamaShuHeiTi*/*.woff "$pkgdir/usr/share/fonts/WOFF/"
    install -m644 阿里妈妈数黑体版权声明.docx "$pkgdir/usr/share/licenses/${pkgname}/"
}

package_woff2-alimama-shuheiti() {
    pkgdesc+="(woff2)"
    install -dm755 "$pkgdir/usr/share/fonts/WOFF2" \
                    "$pkgdir/usr/share/licenses/${pkgname}"

    cd ${srcdir}/AlimamaShuHeiTi
    install -m644 AlimamaShuHeiTi*/*.woff2 "$pkgdir/usr/share/fonts/WOFF2/"
    install -m644 阿里妈妈数黑体版权声明.docx "$pkgdir/usr/share/licenses/${pkgname}/"
}
