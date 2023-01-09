# Maintainer: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-lxgw-fasmart-gothic'
pkgver=1.001
pkgrel=1
pkgdesc="「霞鹜尚智黑」，在「03スマートフォントUI」的基础上修改制作，将新晰黑字面横向压缩 94%，全新英数与假名，更具稳重时尚感。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei"
license=('custom:IPA')
source=("$pkgname-$pkgver.ttf::$url/releases/download/v$pkgver/LXGWFasmartGothic.ttf"
        *.md)
sha256sums=('e6d1526b481d7244517ae87b86470cbd2806d7bd65ae48f5de2cdd742eb1c4b2'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 "$pkgname-$pkgver.ttf" -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
