# Maintainer: Howard Cheung <mail@h-cheung.cf>
# Contributor: AlprC <alprcyan@gmail.com>

pkgname=fcitx5-pinyin-moegirl-rime
pkgver=20211116
_reponame=mw2fcitx
pkgrel=2
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki for rime"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict.yaml")
md5sums=('1a33799f53cd8162bcc24bfd08a3163d')

package() {
  install -Dm644 moegirl.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
