# Maintainer: gaogaoqwq <gaogaoqwq at gmail dot com>

pkgname='ttf-lxgw-neo-xihei-plus'
pkgver=1.215
pkgrel=2
pkgdesc="「霞鹜新晰黑＋ / LXGW Neo XiHei Plus」，在「霞鹜新晰黑」基础上补全扩展 A 区所有汉字，以使字库达到 GB 18030-2022 实现级别 2 的收字范围。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei"
changelog='changelog.txt'
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWNeoXiHeiPlus.ttf"
        LICENSE.md
		LICENSE_CHS.md)
conflicts=('ttf-lxgw-neo-xihei-plus')
sha256sums=('292c288bcae4d5d5af12f92b1e5fa9220a4268e29e943db04ff7f080e3c9c750'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWNeoXiHeiPlus.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
