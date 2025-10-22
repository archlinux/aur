# Maintainer: gaogaoqwq <gaogaoqwq at gmail dot com>
# Contributors: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-lxgw-neo-xihei-screen'
pkgver=25.10.22
pkgrel=1
pkgdesc="霞鹜新晰黑屏幕阅读版。霞鹜新晰黑 的屏幕阅读版本，将原版 霞鹜新晰黑 加粗 6 个单位后，调整度量数据与 Android 默认字体 Roboto 相同。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei-Screen"
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/$pkgver/LXGWNeoXiHeiScreen.ttf"
        LICENSE.md
        LICENSE_CHS.md)
changelog='changelog.txt'
conflicts=('ttf-lxgw-neo-xihei-screen')
sha256sums=('0e04f797ffb497cd717c076dba93259b0117ab5fe2edabf38bdf4a520ad95d20'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" -T "$pkgdir/usr/share/fonts/TTF/$pkgname.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
