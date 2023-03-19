# Maintainer: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-lxgw-neo-xihei-screen-full'
pkgver=1.009
pkgrel=1
pkgdesc="霞鹜新晰黑屏幕阅读版Droid Sans Fallback打底补全版，更适合 PC 及 Android 手机屏幕显示。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei-Screen"
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWNeoXiHeiScreenFull.ttf"
        *.md)
changelog='changelog.txt'
provides=('ttf-lxgw-neo-xihei-screen')
conflicts=('ttf-lxgw-neo-xihei-screen')
sha256sums=('9256cb349bdeffbea9e7ea6b408ec972d6e15455ab8e49bd92de65e238055940'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" -t "$pkgdir/usr/share/fonts/TTF/LXGWNeoXiHeiScreenFull.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
