# Maintainer: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-lxgw-neo-xihei'
pkgver=1.002
pkgrel=3
pkgdesc="霞鹜新晰黑。一款衍生于「IPAexゴシック」的中文黑体字型。A Simplified Chinese sans-serif font derived from IPAex Gothic."
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei"
changelog='changelog.txt'
license=('custom:IPA')
source=("$url/releases/download/v$pkgver/LXGWNeoXiHei.ttf"
        *.md)
conflicts=('ttf-lxgw-neo-xihei')
sha256sums=('dd398f0add023d0620f579cb27d52a9d2405addc2af6bb844d71721704665570'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 LXGWNeoXiHei.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
