# Maintainer: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-lxgw-neo-xihei'
pkgver=1.107
pkgrel=1
pkgdesc="霞鹜新晰黑。一款衍生于「IPAexゴシック」的中文黑体字型。A Simplified Chinese sans-serif font derived from IPAex Gothic."
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei"
changelog='changelog.txt'
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWNeoXiHei.ttf"
        *.md)
conflicts=('ttf-lxgw-neo-xihei')
sha256sums=('adfc600ccc38b17ccdedf5d92397092ddb9122c9d0ce46811c1727342eb4bac2'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" -t "$pkgdir/usr/share/fonts/TTF/LXGWNeoXiHei.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
