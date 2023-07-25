pkgname=ttf-guifanshusong
pkgver=1.0
pkgrel=1
pkgdesc='方正规范书宋，完整覆盖《通用规范汉字表》'
arch=('any')
url='https://github.com/judith04/general-standard-hanzi'
license=('个人非商用')
depends=('fontconfig')
source=("https://github.com/judith04/general-standard-hanzi/raw/main/方正规范书宋/FZGFShuSong_unicode.ttf")
sha256sums=('1a754b202837653ec871da96930c517b2fc6da02e8528bfa5a42c5e2fe731a0d')

package() {
    install -Dm644 "$srcdir/FZGFShuSong_unicode.ttf" "$pkgdir/usr/share/fonts/fzgfshusong/FZGFShuSong.ttf"
}