# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=18.1.3
pkgrel=1
pkgdesc='A font derived from a customized version of Iosevka'
arch=('any')
url='https://github.com/aaronmbos/monocode'
license=('OFL-1.1')
source=("${_name}-${pkgver}-bolditalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalbolditalic.ttf"
        "${_name}-${pkgver}-boldupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalboldupright.ttf"
        "${_name}-${pkgver}-lightitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normallightitalic.ttf"
        "${_name}-${pkgver}-lightupright.ttf::${url}/releases/download/v${pkgver}/monocode-normallightupright.ttf"
        "${_name}-${pkgver}-mediumitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalmediumitalic.ttf"
        "${_name}-${pkgver}-mediumupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalmediumupright.ttf"
        "${_name}-${pkgver}-regularitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalregularitalic.ttf"
        "${_name}-${pkgver}-regularupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalregularupright.ttf"
        "${_name}-${pkgver}-semibolditalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalsemibolditalic.ttf"
        "${_name}-${pkgver}-semiboldupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalsemiboldupright.ttf"
        "${_name}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('81a1f8e8529ce85359800b7b0189ba5bff4d2ac8869aa5e6555f269a38ca4622'
            '32754b9aa8dc3754047961866118abdd4b31579c37fec9ae908d3b6fdf11b701'
            '4c0cc85b21bdb113706880480b9f51610e6e9e84cca31f7dd6de21da6dedcf36'
            '93763320c63c39463b7805d69e86e4e5ad824f9846a94093e28eac1393c00e33'
            'ed7419bfc42d2f1650af29af3faf82242225b7961ad9f45b8471c1e6fd44993e'
            '90e13fc45f4b92b44b4bc67e35c5ccad5aa3d1e4f65ca1fac47e2aeff9db093f'
            'bc9a17df0035485759f1fc94a1e969f2fbee3a82ba206bde27b22a9aac5c4a66'
            'd03c7e563b4d321aadb0f81c00f739db33155e771e6837238c7dfb42b2e7b09d'
            'a107cb863e8406a20b43a00604ef37e1bf157eee6eac8012784185247880504c'
            'c2b90f2ef2076ec10e3a27d331f79f2f57fec50c34464cb0fb421e79b1d91563'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
