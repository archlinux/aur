# Maintainer: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-lxgw-fasmart-gothic'
pkgver=1.201
pkgrel=2
pkgdesc="「霞鹜尚智黑」，在「03スマートフォントUI」的基础上修改制作，将新晰黑字面横向压缩 94%，全新英数与假名，更具稳重时尚感。"
arch=('any')
url="https://github.com/lxgw/LxgwFasmartGothic"
license=('custom:IPA')
changelog="changelog.txt"
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWFasmartGothic.ttf"
        *.md)
conflicts=('ttf-lxgw-fasmart-gothic')
sha256sums=('46c06f85c75aa55b4450fa02c37a35f0f8a4efe8058ffcb6e48b9e2eccd764eb'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" -T "$pkgdir/usr/share/fonts/TTF/$pkgname.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
