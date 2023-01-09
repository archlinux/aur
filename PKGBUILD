# Maintainer: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-lxgw-neo-xihei'
pkgver=1.001
pkgrel=1
pkgdesc="A Simplified Chinese sans-serif font derived from IPAex Gothic. 一款衍生于「IPAexゴシック」的中文黑体字型。"
arch=('any')
url="https://github.com/lxgw/LxgwNeoXiHei"
license=('custom:IPA')
source=("$pkgname-$pkgver.ttf::$url/releases/download/v$pkgver/LXGWNeoXiHei.ttf"
        *.md)
sha256sums=('69d2fd66ddd2f8d7dc62f5918d044df62152aa70fa85f442c06f0b6f14b9d7a8'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            'bce9800ab47cd0961c2a536d5ecfb983442d58eec1db5ff88a5f1a8d1c682367')

package() {
  install -Dm644 "$pkgname-$pkgver.ttf" -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
