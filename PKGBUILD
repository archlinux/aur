# Maintainer: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-lxgw-fasmart-gothic'
pkgver=1.008
pkgrel=1
pkgdesc="「霞鹜尚智黑」，在「03スマートフォントUI」的基础上修改制作，将新晰黑字面横向压缩 94%，全新英数与假名，更具稳重时尚感。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei"
license=('custom:IPA')
changelog="changelog.txt"
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWFasmartGothic.ttf"
        *.md)
conflicts=('ttf-lxgw-fasmart-gothic')
sha256sums=('c7232d9e4bbb46c08665649c4e3c808f012969ad7ae2c5c2beec56a2452e7b71'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" -t "$pkgdir/usr/share/fonts/TTF/LXGWFasmartGothic.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
