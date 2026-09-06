# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>
# Contributors: gaogaoqwq <gaogaoqwq at gmail dot com>
# Contributors: Ziqi Yang <mr.ziqiyang@gmail.com>

pkgname='ttf-lxgw-neo-xihei-screen'
pkgver=26.08.21
pkgrel=1
pkgdesc="霞鹜新晰黑屏幕阅读版。霞鹜新晰黑 的屏幕阅读版本，将原版 霞鹜新晰黑 加粗 6 个单位后，调整度量数据与 Android 默认字体 Roboto 相同。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiZhi-Screen"
license=('IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/$pkgver/LXGWNeoXiHeiScreen.ttf"
        LICENSE.md
        LICENSE_CHS.md)
b2sums=('1dd3b641b1e53c48ea9086c407da0c09caace493ad0b8cfe86c1c549a42b99e0b4a32f1e4bb2ad912f18583d95e253e5f7c94094d646d6c85857b0637cb70b78'
        'b0a7e975e3e8e62b22fe799f49cda26056cd8e511adccaffd95a44918317ac7150cffbcb7a79e1c5c2011129ea91060141d5579e88143c3d7c55c03ef8e572a8'
        '9f9dfa977aa72c33ab8173d092751b052554120b0b76c3349d1bbb89cfec03279e34e04372031b27ecc561d752a109a6022cd7a288c489efa43ecab55cb39d75')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" -T "$pkgdir/usr/share/fonts/TTF/$pkgname.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
