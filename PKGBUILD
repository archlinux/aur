# Maintainer: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-lxgw-neo-xihei-screen'
pkgver=1.003
pkgrel=2
pkgdesc="霞鹜新晰黑屏幕阅读版。霞鹜新晰黑 的屏幕阅读版本，将原版 霞鹜新晰黑 加粗 6 个单位后，调整度量数据与 Android 默认字体 Roboto 相同。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei-Screen"
license=('custom:IPA')
source=("$url/releases/download/v$pkgver/LXGWNeoXiHeiScreen.ttf"
        *.md)
conflicts=('ttf-lxgw-neo-xihei-screen')
sha256sums=('62ba6ead313deb2799367c93d5a4984c668bf201661a70ca8cc1ceed5fbf2595'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 LXGWNeoXiHeiScreen.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
