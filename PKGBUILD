# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

pkgname=rime-pinyin-mihoyo-yukari0201 # 由于已经存在了一个 fcitx5-pinyin-mihoyo，我不得不加一个后缀
pkgver=20260724 # renovate: datasource=github-tags depName=Yukari0201/fcitx5-pinyin-mihoyo
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

sha256sums=('3c6529b77fa728c5dcf057c16aba5f4696dd1e69ef79bebb7788973eb934c8b1'
            '87a2394acb4efb13b2f1cbab5062fcb771620f6fb6e6efaeff253368737071e5'
            '1f2b9d177e9ad258a5323fbfb4864e8ee07d2dd923e48fe83771b5e199a366ed'
            'f22859dd02cd4c8448133a487444cfea9da9271f0b54e203cb163520d751a091'
            'bc065fdce6661b94e5b3c2400f12e87557e25442fff24028a08f9893a20bd649'
            'd97e57f57fe5eeecb3ad854f5cdb8a35399a0f4a5c67d0596c7a68a9ca5295e9'
            '7b0847f6f112fdddfb6315489cdd894c913e475404b4fdcb8251849cea6dd71b'
            'f18c61819b1451e8f27d7c532668f6259ed716fdc20a6126652612d0d5112668')

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
