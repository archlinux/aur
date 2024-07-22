# Maintainer: lakejason0 <lakesarchive@outlook.com>
pkgname='ttf-lxgw-heart-serif'
pkgver=0.924.2
pkgrel=1
pkgdesc="基于「こころ明朝体」以及「霞鹜新致宋」「霞鹜致宋 CL/MN」衍生的中文黑体字型。将字面横向压缩 85%，并增加圆角，更加清瘦、圆润。"
arch=('any')
url="https://github.com/lxgw/LxgwHeartSerif"
license=('custom:IPA')
source=("$pkgname-$pkgver-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWHeartSerif.ttf"
        "$pkgname-$pkgver-CL-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWHeartSerifCL.ttf"
        "$pkgname-$pkgver-MN-$pkgrel.ttf::$url/releases/download/v$pkgver/LXGWHeartSerifMN.ttf"
        license.txt)
changelog='changelog.txt'
conflicts=('ttf-lxgw-heart-serif')
sha256sums=('ad5808fcef71962064804e01024b637bdea44e8b57a482d2048cc02e805d1182'
            '14fd175550a20ebf488b87d24cecf4eae3dfcefe355f2ffd9648f7c862385a4e'
            '6c558bab89ecd0c273a4e6f12ceb1749babe3d5266fe29eea264ef99b82671b8'
            'daf91386d6f9a6a78e4e736c0c00375cae30214ac5c1dab2479f0a05fcb63edd')

package() {
  install -Dm644 "$pkgname-$pkgver-$pkgrel.ttf" -t "$pkgdir/usr/share/fonts/TTF/LXGWHeartSerif.ttf"
  install -Dm644 "$pkgname-$pkgver-CL-$pkgrel.ttf" -t "$pkgdir/usr/share/fonts/TTF/LXGWHeartSerifCL.ttf"
  install -Dm644 "$pkgname-$pkgver-MN-$pkgrel.ttf" -t "$pkgdir/usr/share/fonts/TTF/LXGWHeartSerifMN.ttf"
  install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
