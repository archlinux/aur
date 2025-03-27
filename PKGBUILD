# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-neo-zhisong'
pkgver=1.030.1
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
sha256sums=('80580146fad94b20e38c818a660bffa91719b417e71b570774cae4998a769985'
            'cd1df4c6d086fbcd9da706014344451ad666edae5d72fd816640fa9eca1dc38e'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWNeoZhiSong.ttf"
  install -Dm644 "$pkgname-plus-$pkgver-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWNeoZhiSongPlus.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHS.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
