# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-neo-zhisong'
pkgver=1.066
pkgrel=1
pkgdesc="霞鹜新致宋。一款衍生于「IPAmj明朝」的中文宋体字型。A Chinese serif font derived from IPAmj Mincho."
arch=('any')
url="https://github.com/lxgw/LxgwNeoZhiSong"
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWNeoZhiSong.ttf"
        "$pkgname-plus-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWNeoZhiSongPlus.ttf"
        *.md)
changelog='changelog.txt'
conflicts=('ttf-lxgw-neo-zhisong')
sha256sums=('95936a086ff7ad8e8b30288dec0e20e817976fa1275d8f11a85b1e6144c8d017'
            '279c973effc2811a827713ffa12706d556cab10b5067c0728400bf9e464f7008'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWNeoZhiSong.ttf"
  install -Dm644 "$pkgname-plus-$pkgver-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWNeoZhiSongPlus.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
