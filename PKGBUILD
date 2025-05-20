# Maintainer: Azure Zeng (weedycn at outlook dot com)
# Contributor: LockRim <lockrim@qq.com>
# Contributor: shniubobo <shniubobo at outlook dot com>
# Contributor: Howard Cheung <mail@h-cheung.cf>
# Contributor: AlprC <alprcyan@gmail.com>
# Contributor: DeepChirp <DeepChirp@outlook.com>

pkgname=rime-pinyin-moegirl
pkgver=20250509
pkgrel=1
pkgdesc="Rime Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('MIT License' 'cc-by-nc-sa-3.0')
source=("moegirl-${pkgver}.dict.yaml::${url}/releases/download/${pkgver}/moegirl.dict.yaml"
        "${url}/blob/pkg/moegirl/${pkgver}/LICENSE")
sha256sums=('2ed7b5c6381aca146b930d519010b2f848adcec45bc0586d62b8654ea6cebed0'
            'ff7ad7d16ea7aa052a60b96a5417d606fab189511c5cc8e048c926576ebea974')

package() {
    install -Dm644 moegirl-${pkgver}.dict.yaml "${pkgdir}/usr/share/rime-data/moegirl.dict.yaml"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
