# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-heart-serif'
pkgver=0.920.5
pkgrel=1
pkgdesc="「霞鹜铭心宋」，在「こころ明朝体」的基础上修改制作，将新致宋字面横向压缩 85%，并增加圆角，更加清瘦、圆润。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoZhiSong"
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWHeartSerif.ttf"
        *.md)
changelog='changelog.txt'
conflicts=('ttf-lxgw-heart-serif')
sha256sums=('89b9f35ae814eb825f8f6706668730e8309a9292fdc37037ee2212d19e1fbf62'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" -t "$pkgdir/usr/share/fonts/TTF/LXGWHeartSerif.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
