# Maintainer: Azure Zeng (weedycn at outlook dot com)
# Contributor: LockRim <lockrim@qq.com>
# Contributor: shniubobo <shniubobo at outlook dot com>
# Contributor: Howard Cheung <mail@h-cheung.cf>
# Contributor: AlprC <alprcyan@gmail.com>

pkgname=fcitx5-pinyin-moegirl-rime
pkgver=20230714
_reponame=mw2fcitx
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki for rime"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict.yaml")
sha256sums=('4ba143c84ff10ad062d8909ccdcba1e7a9130b3904c9ed2e0457bfde3d49dce5')

package() {
    install -Dm644 moegirl.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
