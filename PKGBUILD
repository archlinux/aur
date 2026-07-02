# Maintainer: Gavin Luo <lunt.luo@gmail.com>

pkgname=rime-wanxiang-gram-zh-hans
pkgver=20260703.003430
pkgrel=1
epoch=2
pkgdesc="万象词库中文语法模型"
arch=(any)
license=('CC-BY-4.0')
url="https://github.com/amzxyz/RIME-LMDG"
source=("wanxiang-lts-zh-hans.${pkgver}.gram::${url}/releases/download/LTS/wanxiang-lts-zh-hans.gram")
sha256sums=('f4b2f9db3ac77cae9ba19caa30370e94de52bdf9824df2d97f27b96431effcf0')

package_rime-wanxiang-gram-zh-hans() {
    replaces=(rime-lmdg)

    install -Dm664 "${srcdir}/wanxiang-lts-zh-hans.${pkgver}.gram" "${pkgdir}"/usr/share/rime-data/wanxiang-lts-zh-hans.gram
}
