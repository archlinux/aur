# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-heart-serif'
pkgver=1.011
pkgrel=3
pkgdesc="基于「こころ明朝体」以及「霞鹜新致宋」「霞鹜致宋 CL/MN」衍生的中文宋体字型。将字面横向压缩 85%，并增加圆角，更加清瘦、圆润。"
arch=('any')
url="https://github.com/lxgw/LxgwHeartSerif"
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWHeartSerif.ttf"
        "$pkgname-$pkgver-CL-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWHeartSerifCL.ttf"
        "$pkgname-$pkgver-MN-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWHeartSerifMN.ttf"
        license.txt)
changelog='changelog.txt'
conflicts=('ttf-lxgw-heart-serif')
sha256sums=('c31ad15b1b3eee633ff74ac3d7b6440a73be7286a508ad190ffbb54b3cd61c31'
            'a9d5046959849e0b22288cabe847db0c643e9e4f331032a669cf69c5b59324e1'
            '05e82824536e9e0e78b1fc608033cc5885a36107148dea60297deddb643f9ea9'
            'daf91386d6f9a6a78e4e736c0c00375cae30214ac5c1dab2479f0a05fcb63edd')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWHeartSerif.ttf"
  install -Dm644 "$pkgname-$pkgver-CL-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWHeartSerifCL.ttf"
  install -Dm644 "$pkgname-$pkgver-MN-$pkgrel.ttf" "$pkgdir/usr/share/fonts/TTF/LXGWHeartSerifMN.ttf"
  install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
