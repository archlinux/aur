# Maintainer: taotieren <admin@taotieren.com>

pkgbase=alimama-shuheiti
pkgname=({ttf,otf,woff,woff2}-$pkgbase)
pkgver=1.005
pkgrel=1
pkgdesc="阿里妈妈数黑体 AlimamaShuHeiTi"
url="https://www.alibabafonts.com/#/more"
makedepends=(libarchive)
license=("LicenseRef-Custom")
arch=(any)
# fonts.alibabadesign.com has enabled Referer anti-hotlinking; a Referer from the same domain is required to download files.
DLAGENTS=('https::/usr/bin/curl -fLC - --referer https://fonts.alibabadesign.com/ -o %o %u')
source=("$pkgbase-$pkgver.zip::https://fonts.alibabadesign.com/AlimamaShuHeiTi/AlimamaShuHeiTi-Bold.zip")
sha256sums=('fbb4b7f1ca5f3b60432a56c329da98e596388586413dcccddd97717a3b43cce4')

package_ttf-alimama-shuheiti() {
    pkgdesc+="(ttf)"
    install -dm755 "$pkgdir/usr/share/fonts/TTF" \
        "$pkgdir/usr/share/licenses/${pkgname}"

    install -m644 ${srcdir}/AlimamaShuHeiTi*.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 ${srcdir}/*.txt -t "$pkgdir/usr/share/licenses/${pkgname}/"
}

package_otf-alimama-shuheiti() {
    pkgdesc+="(otf)"
    install -dm755 "$pkgdir/usr/share/fonts/OTF" \
        "$pkgdir/usr/share/licenses/${pkgname}"

    install -m644 ${srcdir}/AlimamaShuHeiTi*.otf "$pkgdir/usr/share/fonts/OTF/"
    install -m644 ${srcdir}/*.txt -t "$pkgdir/usr/share/licenses/${pkgname}/"
}

package_woff-alimama-shuheiti() {
    pkgdesc+="(woff)"
    install -dm755 "$pkgdir/usr/share/fonts/WOFF" \
        "$pkgdir/usr/share/licenses/${pkgname}"

    install -m644 ${srcdir}/AlimamaShuHeiTi*.woff "$pkgdir/usr/share/fonts/WOFF/"
    install -m644 ${srcdir}/*.txt -t "$pkgdir/usr/share/licenses/${pkgname}/"
}

package_woff2-alimama-shuheiti() {
    pkgdesc+="(woff2)"
    install -dm755 "$pkgdir/usr/share/fonts/WOFF2" \
        "$pkgdir/usr/share/licenses/${pkgname}"

    install -m644 ${srcdir}/AlimamaShuHeiTi*.woff2 "$pkgdir/usr/share/fonts/WOFF2/"
    install -m644 ${srcdir}/*.txt -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
