# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-zhisong'
pkgver=0.512.1
pkgrel=1
pkgdesc="霞鶩緻宋。一款衍生於「IPAex 明朝」的舊字形寫法中文字型。A Chinese font derived from IPAex Mincho."
arch=('any')
url="https://github.com/lxgw/LxgwZhiSong"
license=('custom:IPA')
source=("$pkgname-$pkgver-CL-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWZhiSongCL.ttf"
        "$pkgname-$pkgver-MN-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWZhiSongMN.ttf"
        *.md)
changelog='changelog.txt'
conflicts=('ttf-lxgw-zhisong')
sha256sums=('d7af8c076c7741a8fe9e226e60160db127738d69041e00e4e7ba2775f027d038'
            '8cd5412be90d6b0aa0ee51eaa15439f4b16b79a03a894e3cbfedbadb34e8dc92'
            'e33bc6a5f48e8fef08f7ab74b24b199c2d6b1495d7a6fc5cc285c1e44d768877'
            '18e639e1d5d575cb92694c79b2aed1781a234eb5be4200c1479a6c27e11fddcc')

package() {
  install -Dm644 "$pkgname-$pkgver-CL-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWZhiSongCL.ttf"
  install -Dm644 "$pkgname-$pkgver-MN-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWZhiSongMN.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHT.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
