# Maintainer: Azure Zeng (weedycn at outlook dot com)
# Contributor: LockRim <lockrim@qq.com>
# Contributor: shniubobo <shniubobo at outlook dot com>
# Contributor: Howard Cheung <mail@h-cheung.cf>
# Contributor: AlprC <alprcyan@gmail.com>

pkgname=fcitx5-pinyin-moegirl-rime
pkgver=20231114
_reponame=mw2fcitx
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki for rime"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict.yaml")
sha256sums=('c840b5135d67f529323e15bf255a56b92e71a62f1c2eb05c42375e066cc95c9d')

package() {
    install -Dm644 moegirl.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
