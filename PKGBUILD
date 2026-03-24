# Maintainer: DeepChirp <DeepChirp@outlook.com>
# Contributor: LockRim <lockrim@qq.com>
# Contributor: shniubobo <shniubobo at outlook dot com>
# Contributor: Howard Cheung <mail@h-cheung.cf>
# Contributor: AlprC <alprcyan@gmail.com>
# Contributor: Azure Zeng (weedycn at outlook dot com)

pkgname=rime-pinyin-moegirl
pkgver=20260315
pkgrel=1
pkgdesc="Rime Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('MIT License' 'cc-by-nc-sa-3.0')
source=("moegirl-${pkgver}.dict.yaml::${url}/releases/download/${pkgver}/moegirl.dict.yaml"
        "${url}/raw/refs/heads/pkg-moegirl/LICENSE")
sha256sums=('88d44342c0e0f06e7c9929039f3a065157d65f761ecc8595c25e4224c281fb01'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c')

package() {
    install -Dm644 moegirl-${pkgver}.dict.yaml "${pkgdir}/usr/share/rime-data/moegirl.dict.yaml"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
