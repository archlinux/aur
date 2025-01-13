# Maintainer: Azure Zeng (weedycn at outlook dot com)
# Contributor: LockRim <lockrim@qq.com>
# Contributor: shniubobo <shniubobo at outlook dot com>
# Contributor: Howard Cheung <mail@h-cheung.cf>
# Contributor: AlprC <alprcyan@gmail.com>
# Contributor: DeepChirp <DeepChirp@outlook.com>

pkgname=rime-pinyin-moegirl
pkgver=20250113
pkgrel=1
pkgdesc="Rime Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("moegirl-${pkgver}.dict.yaml::${url}/releases/download/${pkgver}/moegirl.dict.yaml"
        "${url}/raw/master/LICENSE")
sha256sums=('5eda06b92f4b3f57ea4b13cc8df8057f26b22a971a028a1a98b9ccc12d9f6a6f'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c')

package() {
    install -Dm644 moegirl-${pkgver}.dict.yaml "${pkgdir}/usr/share/rime-data/moegirl.dict.yaml"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
