# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-zhisong'
pkgver=0.500
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
sha256sums=('dd35f1df4f46f2839caf19ca3f38c6d3c8ccdfeb8bf0a78b4bbdd4a230c29668'
            '65c2afa8e88f2a9b80bdceeb184e64654d580893e182991002c29c93d484ce03'
            'e33bc6a5f48e8fef08f7ab74b24b199c2d6b1495d7a6fc5cc285c1e44d768877'
            '18e639e1d5d575cb92694c79b2aed1781a234eb5be4200c1479a6c27e11fddcc')

package() {
  install -Dm644 "$pkgname-$pkgver-CL-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWZhiSongCL.ttf"
  install -Dm644 "$pkgname-$pkgver-MN-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWZhiSongMN.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHT.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
