# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

pkgname=rime-pinyin-mihoyo-yukari0201 # 由于已经存在了一个 fcitx5-pinyin-mihoyo，我不得不加一个后缀
pkgver=20260731 # renovate: datasource=github-tags depName=Yukari0201/fcitx5-pinyin-mihoyo
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

sha256sums=('f040393267cd33475ccad02287a102ff59b222d29fea74dc11bd1cd0447361be'
            'e839f7e18fdb1cbde87cbccf2c02c25ee1295d3f52e55b7ab45387ec0dbf2eb7'
            '44f641133d08d73877522024fd95da4773cc7127fd9dc0b2f3c5f33f87f63124'
            '6ab28639d72052b03dc1d92744525013b0a765d4af9c8300e139d7a5fa82349b'
            'a7117b4fd3f12fb979bb8a7cc7337439b3397e1c312257df411b0d128daf8cfb'
            'd86dfbaf34ebe766691364a2afc19432b9881cdd34ba072a3d1fc84b44b5eca9'
            '9992413485e3a36eb3cc54da8b586f438d426972933a657901b657b31a28205b'
            '7663ea08364e6b57f20524f14fc213ec5eeea21a682a7011b30d2554d1bfa067')

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
