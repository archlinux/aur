# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=0.201
pkgrel=1
pkgdesc="An open-source Chinese font derived from Fontworks' Klee One."
arch=('any')
url='https://github.com/lxgw/LxgwWenKai'
license=('OFL')
_fontfile=LXGWWenKai-Regular.ttf
source=("${pkgname}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/v${pkgver}/${_fontfile}"
    "${pkgname}-${pkgver}-${pkgrel}-LICENSE::https://github.com/lxgw/LxgwWenKai/raw/v${pkgver}/SIL_Open_Font_License_1.1.txt")
sha256sums=('5d5af5c4a1b0a842ace653df56a17303ed2095112158a6e40b602bb6281fe173'
    'e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602')

package() {
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/${_fontfile}"
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
