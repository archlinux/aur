# Maintainer: Azure Zeng (weedycn at outlook dot com)
# Contributor: LockRim <lockrim@qq.com>
# Contributor: shniubobo <shniubobo at outlook dot com>
# Contributor: Howard Cheung <mail@h-cheung.cf>
# Contributor: AlprC <alprcyan@gmail.com>
# Contributor: DeepChirp <DeepChirp@outlook.com>

pkgname=rime-pinyin-moegirl
pkgver=20241109
_reponame=mw2fcitx
pkgrel=2
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki for rime"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict.yaml")
sha256sums=('067a6fee2a933d13674a267a669cdc4172d991b15b6749d0830d9df88c9364e4')

package() {
    install -Dm644 moegirl.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
