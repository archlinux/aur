# Maintainer: LockRim <lockrim@qq.com>
# Contributor: shniubobo <shniubobo at outlook dot com>
# Contributor: Howard Cheung <mail@h-cheung.cf>
# Contributor: AlprC <alprcyan@gmail.com>

pkgname=fcitx5-pinyin-moegirl-rime
pkgver=20230414
_reponame=mw2fcitx
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki for rime"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict.yaml")
sha256sums=('d210e3175fc6b7e394ebf60463eb7579f2115a9a8faca22268c441434cc45898')

package() {
  install -Dm644 moegirl.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
