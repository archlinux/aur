# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

pkgname=fcitx5-pinyin-mihoyo-yukari0201 # 由于已经存在了一个 fcitx5-pinyin-mihoyo，我不得不加一个后缀
pkgver=20260427
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary for miHoYo Games from wiki.biligame.com"
arch=('any')
url="https://github.com/Yukari0201/fcitx5-pinyin-mihoyo" # renovate: datasource=github-releases depName=Yukari0201/fcitx5-pinyin-mihoyo
license=('CC-BY-SA-4.0')
source=(
    "${url}/releases/download/${pkgver}/genshin.dict"
    "${url}/releases/download/${pkgver}/honkai3rd.dict"
    "${url}/releases/download/${pkgver}/starrail.dict"
    "${url}/releases/download/${pkgver}/zenlesszonezero.dict"
)

sha256sums=(
    "4f5c7b25e98decf7cfc19018da15502339f517a527b68ad585b81fb6d3bb6c64"
    "99150a9be7da6761095e4ba0fee2c8d34883b9fb6cc9e5c0cc1044b09e0529cf"
    "61aeba0f6ec9bdea9fe240a0b1ab65afea1f43249c2c7a7958b1f5f6fab67194"
    "99150a9be7da6761095e4ba0fee2c8d34883b9fb6cc9e5c0cc1044b09e0529cf"
)

package() {
    # Fcitx5
    install -Dm644 genshin.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
    install -Dm644 honkai3rd.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
    install -Dm644 starrail.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
    install -Dm644 zenlesszonezero.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}