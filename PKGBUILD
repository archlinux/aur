pkgname=ttf-hyzhongheiti-extbcdefg
pkgver=4
pkgrel=1
pkgdesc='汉仪中黑超大字符（HYZhongHeiTi-ExtBCDEFG）'
arch=('any')
url='https://www.hanyi.com.cn/productdetail?id=968&type=0'
license=('custom')
depends=('fontconfig')
source=("https://ime-shengpizi-1258344701.cos.ap-beijing.myqcloud.com/font/4/4.ttf.zip")
md5sums=('402a3d07ed3d86fd6e3b9a6f20a11ae8')

package() {
    install -Dm644 "$srcdir/4.ttf" "$pkgdir/usr/share/fonts/TTF/HYZhongHeiTi-ExtBCDEFG.ttf"
}
