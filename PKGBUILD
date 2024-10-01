# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-neo-zhisong'
pkgver=1.018
pkgrel=1
pkgdesc="霞鹜新致宋。一款衍生于「IPAmj明朝」的中文宋体字型。A Chinese serif font derived from IPAmj Mincho."
arch=('any')
url="https://github.com/lxgw/LxgwNeoZhiSong"
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWNeoZhiSong.ttf"
        *.md)
changelog='changelog.txt'
conflicts=('ttf-lxgw-neo-zhisong')
sha256sums=('a36cf07e7f8e9c6c520cbb8ae032160f60b5b885c29e6dacb79f1587149a18c1'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" -t "$pkgdir/usr/share/fonts/TTF/LXGWNeoZhiSong.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
