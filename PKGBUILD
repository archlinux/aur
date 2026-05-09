# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-xihei'
pkgver=0.530
pkgrel=1
pkgdesc="霞鶩晰黑。一款衍生於「IPAex ゴシック」的舊字形寫法中文字型。A Chinese font derived from IPAex Gothic."
arch=('any')
url="https://github.com/lxgw/LxgwXiHei"
license=('custom:IPA')
source=("$pkgname-$pkgver-CL-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWXiHeiCL.ttf"
        "$pkgname-$pkgver-MN-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWXiHeiMN.ttf"
        *.md)
changelog='changelog.txt'
conflicts=('ttf-lxgw-xihei')
sha256sums=('ee7b68a356bf8eb65521c6476073e63eef04ebea606a586f1f09918c2147f884'
            'd538299f4da67689026c576a1ac0ef889eece5ee020aeefca4bbd4e8c5c4e6a1'
            'e33bc6a5f48e8fef08f7ab74b24b199c2d6b1495d7a6fc5cc285c1e44d768877'
            '18e639e1d5d575cb92694c79b2aed1781a234eb5be4200c1479a6c27e11fddcc')

package() {
  install -Dm644 "$pkgname-$pkgver-CL-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWXiHeiCL.ttf"
  install -Dm644 "$pkgname-$pkgver-MN-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWXiHeiMN.ttf"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_CHT.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
