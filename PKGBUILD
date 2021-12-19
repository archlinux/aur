# Maintainer: Howard Cheung <mail@h-cheung.cf>
# Contributor: AlprC <alprcyan@gmail.com>

pkgname=fcitx5-pinyin-moegirl-rime
pkgver=20211214
_reponame=mw2fcitx
pkgrel=3
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki for rime"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict.yaml")
md5sums=('9ce05f74eb157426b8dde6b5d5b10402')

package() {
  install -Dm644 moegirl.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
