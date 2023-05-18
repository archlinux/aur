# Maintainer: Ziqi Yang <mr.ziqiyang@gmail.com>
pkgname='ttf-zpix'
pkgver=3.1.8
pkgrel=1
pkgdesc="最像素ttf版本。支持英文、繁体中文、简体中文、日文。"
arch=('any')
url="https://github.com/SolidZORO/zpix-pixel-font"
changelog='changelog.txt'
license=('custom')
source=("${pkgname}-${pkgver}.ttf::${url}/releases/download/v${pkgver}/zpix.ttf"
        "LICENSE")
conflicts=("ttf-zpix")
sha256sums=('50880b1ac5536f285830a7d362203e319995e1d153f475f7b314ddadc738bc4d'
            'bb2760d6e1f31db7ddf1b085c6a063192ca499bb0e643dcb01a6b4a97884de3b')

package() {
  install -Dm644 "$pkgname-$pkgver.ttf" -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
