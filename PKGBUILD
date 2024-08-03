# Maintainer: SiHuaN <sihuan@sakuya.love>

pkgbase=fcitx5-pinyin-mihoyo
pkgname=('fcitx5-pinyin-genshin' 'fcitx5-pinyin-genshin-rime' 'fcitx5-pinyin-starrail' 'fcitx5-pinyin-starrail-rime' 'fcitx5-pinyin-honkai3rd' 'fcitx5-pinyin-honkai3rd-rime')
pkgver=20240803
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary for miHoYo Games from wiki.biligame.com"
arch=('any')
url="https://github.com/sihuan/mw2fcitx"
license=('CC-BY-SA-4.0')
source=("${url}/releases/download/${pkgver}/genshin.dict"
    "${url}/releases/download/${pkgver}/genshin.dict.yaml"
    "${url}/releases/download/${pkgver}/starrail.dict"
    "${url}/releases/download/${pkgver}/starrail.dict.yaml"
    "${url}/releases/download/${pkgver}/honkai3rd.dict"
    "${url}/releases/download/${pkgver}/honkai3rd.dict.yaml")

sha256sums=('16811c8a10613c6ea2399a3ea89ab81085eaa2a8031b00e817f676ba8be672bd'
            '7a76173335fbb7d18885491a1340686fc59884a09b74b8f20eda65f0d9b824b9'
            '102bd183da6b0fdce6746bce096ce031f3c36692a36ebd6cc26185f2d811c652'
            'd77aa943b92ebd968d8d1b68ca48cd868092a2b73e6febf5ad160797ea693ee7'
            '9915eec217025a27eeb9013289ef25d5ce72f2f8615e7652ecf11502a229090e'
            'dccdd9ec66ecbaf63c69d6a2a2ca6c36ace70875be60438b34adade00ac76cc6')
package_fcitx5-pinyin-genshin() {
    pkgdesc="Genshin Fcitx 5 Pinyin Dictionary from wiki.biligame.com"
    groups=('fcitx5-pinyin-mihoyo')
    install -Dm644 genshin.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}

package_fcitx5-pinyin-genshin-rime() {
    pkgdesc="Genshin Fcitx 5 Pinyin Dictionary from wiki.biligame.com"
    groups=('fcitx5-pinyin-mihoyo-rime')
    install -Dm644 genshin.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}

package_fcitx5-pinyin-starrail() {
    pkgdesc="Starrail Fcitx 5 Pinyin Dictionary from wiki.biligame.com"
    groups=('fcitx5-pinyin-mihoyo')
    install -Dm644 starrail.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}

package_fcitx5-pinyin-starrail-rime() {
    pkgdesc="Starrail Fcitx 5 Pinyin Dictionary from wiki.biligame.com"
    groups=('fcitx5-pinyin-mihoyo-rime')
    install -Dm644 starrail.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}

package_fcitx5-pinyin-honkai3rd() {
    pkgdesc="Honkai3rd Fcitx 5 Pinyin Dictionary from wiki.biligame.com"
    groups=('fcitx5-pinyin-mihoyo')
    install -Dm644 honkai3rd.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}

package_fcitx5-pinyin-honkai3rd-rime() {
    pkgdesc="Honkai3rd Fcitx 5 Pinyin Dictionary from wiki.biligame.com"
    groups=('fcitx5-pinyin-mihoyo-rime')
    install -Dm644 honkai3rd.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
