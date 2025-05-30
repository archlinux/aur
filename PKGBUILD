# Maintainer: gaogaoqwq <gaogaoqwq at gmail dot com>

pkgname='ttf-lxgw-neo-xihei-plus'
pkgver=1.217
pkgrel=1
pkgdesc="「霞鹜新晰黑＋ / LXGW Neo XiHei Plus」，在「霞鹜新晰黑」基础上补全扩展 A 区所有汉字，以使字库达到 GB 18030-2022 实现级别 2 的收字范围。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei"
changelog='changelog.txt'
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWNeoXiHeiPlus.ttf"
        LICENSE.md
		LICENSE_CHS.md)
conflicts=('ttf-lxgw-neo-xihei-plus')
sha256sums=('09f2ff2bf9ee39f6de1843a7505bc32e57a019997c057ccd61b946309ac2889e'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWNeoXiHeiPlus.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
