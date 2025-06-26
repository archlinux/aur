# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=18.0.5
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
sha256sums=('8c35f72881077b7921ce03246bd575489ac1934c17f3a7cb38b1bdb926c0a334'
            '18596549a7d94b8a3e5769e5a6f37a0fe55409b553d52096c86b0853b13f39fb'
            '427f91257baaf6c313808bea3575d59e1d84dd0988309bc851e1ba554e05bc21'
            '725ec8e383dc5e30c01bea687e1bcd6181ef566d9fda1c3da58aaa9c4f1a5828'
            '1111cc154650e2f5d28fbe72e619bfd6136f275e91080d9df6442431e3ba0e6c'
            '2f99a73bbbc98201dec0bf3af262507c7d7187b785bc3eced0ca6bc8d6ce12cc'
            '754f8f8898144427a03ecc7986013f8dd34d58bd41aea35e8747bc1f9c487284'
            'b436c38ee9e59a6cc38889b127c8d79a3aa33cdd378919fd1c8253cd97239b5b'
            '331597edf8dfa31f9137e7fcd3686c5ac62ac6bea19016458792716932d15dfe'
            '4132b1fb351dc286e3a983d39d61359ea34f1140950221ff7d7777f37ff0877e'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
