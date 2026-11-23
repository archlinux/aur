# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-zhisong'
pkgver=1.003
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
sha256sums=('94e07344c2ca1cdd44a8a78fd93a270444f32dd7ebfc637a87261f3355ddd288'
            '573e753a0fb9a0f8d19578472e3f64c4c1834a0f22ed531a44f066c064cb19e8'
            '18e639e1d5d575cb92694c79b2aed1781a234eb5be4200c1479a6c27e11fddcc'
            'e33bc6a5f48e8fef08f7ab74b24b199c2d6b1495d7a6fc5cc285c1e44d768877')

package() {
  install -Dm644 "$pkgname-$pkgver-CL-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWZhiSongCL.ttf"
  install -Dm644 "$pkgname-$pkgver-MN-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWZhiSongMN.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHT.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
