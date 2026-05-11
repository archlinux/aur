# Maintainer: Maxxx <macsim.gong@yandex.com>
# Maintainer: MessQAQ2333 <MessQAQ@tutamail.com>

pkgname=ttf-renoufangsong-16
pkgver=1.1.1
pkgrel=1
pkgdesc="「人偶仿宋 16」是基于「KHドットフォントシリーズ」中的「KHドット人形町16」增补简繁体汉字的 16px 点阵字体，适合在像素风格的游戏中作为装饰性手写体使用。"
arch=("any")
url="https://github.com/yzdnn/RenOuFangSong-16"
license=("OFL-1.1")
source=("https://github.com/yzdnn/RenOuFangSong-16/releases/download/v$pkgver/RenOuFangSong-16.ttf"
    "https://raw.githubusercontent.com/yzdnn/RenOuFangSong-16/refs/heads/main/OFL.txt")

sha256sums=('20752474027efabc16d940b4b213d3462212b85df59b632d58c79d8c6d1ce27d'
    '40b328d200a05f92e68cdda6a6d3803ee58667521052428ad14cb3bde3e05230')

package() {
    install -Dm644 -t $pkgdir/usr/share/fonts/TTF/ RenOuFangSong-16.ttf
    install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname/ OFL.txt
}
