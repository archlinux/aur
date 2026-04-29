# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

pkgname=rime-pinyin-mihoyo-yukari0201 # 由于已经存在了一个 fcitx5-pinyin-mihoyo，我不得不加一个后缀
pkgver=20260429 # renovate: datasource=github-tags depName=Yukari0201/fcitx5-pinyin-mihoyo
pkgrel=1
pkgdesc="Rime Pinyin (inclue wanxiang pinyin) Dictionary for miHoYo Games from wiki.biligame.com"
arch=('any')
url="https://github.com/Yukari0201/fcitx5-pinyin-mihoyo"
license=('CC-BY-SA-4.0')
source=(
    "${url}/releases/download/${pkgver}/genshin.dict.yaml"
    "${url}/releases/download/${pkgver}/honkai3rd.dict.yaml"
    "${url}/releases/download/${pkgver}/starrail.dict.yaml"
    "${url}/releases/download/${pkgver}/zenlesszonezero.dict.yaml"
    "${url}/releases/download/${pkgver}/wanxiang_genshin.dict.yaml"
    "${url}/releases/download/${pkgver}/wanxiang_honkai3rd.dict.yaml"
    "${url}/releases/download/${pkgver}/wanxiang_starrail.dict.yaml"
    "${url}/releases/download/${pkgver}/wanxiang_zenlesszonezero.dict.yaml"
)

sha256sums=('9e2b658ceee76256cfcb4f0cc42d1a7d6092c31e720339749a65deb220d22207'
            '905a34afcb38ade47a9006f9cb28c028c3a3b5cd838e4c9d7aad1e1795e836ed'
            '23b2e90195ee4896ec836523803f96232f2eccf4b8f1836ca860e9e2a40ca892'
            '00fb2839d72aefa88b4bba2f6d6a7e5f76d66246885ff7d958cf327c4f10b106'
            '759d487e8237c999773c27dad37451950de7c156693604a764a47a8451be9bbd'
            'd073ef948fe026d53c81907324f20f5b4f914196696288526eacf30c3ea2c1b6'
            '99a05f0ee1193f03b5508dba902f95d35fccb56fc8652fd2a0b11cd39dcb547e'
            '5b3b2acd204cdc67324079b890ec6efa5ee927bb1b08163aace0afec2524a05d')

package() {
    # Rime
    install -Dm644 genshin.dict.yaml -t ${pkgdir}/usr/share/rime-data/
    install -Dm644 honkai3rd.dict.yaml -t ${pkgdir}/usr/share/rime-data/
    install -Dm644 starrail.dict.yaml -t ${pkgdir}/usr/share/rime-data/
    install -Dm644 zenlesszonezero.dict.yaml -t ${pkgdir}/usr/share/rime-data/
    # wanxiang
    install -Dm644 wanxiang_genshin.dict.yaml -t ${pkgdir}/usr/share/rime-data/
    install -Dm644 wanxiang_honkai3rd.dict.yaml -t ${pkgdir}/usr/share/rime-data/
    install -Dm644 wanxiang_starrail.dict.yaml -t ${pkgdir}/usr/share/rime-data/
    install -Dm644 wanxiang_zenlesszonezero.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
