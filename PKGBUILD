# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: A. Benz <hello@benz.dev>

_pkgauthor=abenz1267
_pkgname=walker

pkgname=${_pkgname}-bin

pkgver=2.17.0
pkgrel=1
_pkgvername=v${pkgver}

pkgdesc='wayland application runner'

arch=('x86_64')
_barch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'glib2' 'gtk4' 'gtk4-layer-shell' 'poppler-glib' 'cairo' 'elephant')
optdepends=('elephant-all: elephant + all official elephant providers')

backup=("etc/xdg/${_pkgname}/config.toml")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "config-${pkgver}.toml::${_urlraw}/resources/config.toml"
        "item-${pkgver}.xml::${_urlraw}/resources/themes/default/item.xml"
        "item_actionsmenu-${pkgver}.xml::${_urlraw}/resources/themes/default/item_actionsmenu.xml"
        "item_aptpackages-${pkgver}.xml::${_urlraw}/resources/themes/default/item_aptpackages.xml"
        "item_archlinuxpkgs-${pkgver}.xml::${_urlraw}/resources/themes/default/item_archlinuxpkgs.xml"
        "item_bookmarks-${pkgver}.xml::${_urlraw}/resources/themes/default/item_bookmarks.xml"
        "item_calc-${pkgver}.xml::${_urlraw}/resources/themes/default/item_calc.xml"
        "item_clipboard-${pkgver}.xml::${_urlraw}/resources/themes/default/item_clipboard.xml"
        "item_dmenu-${pkgver}.xml::${_urlraw}/resources/themes/default/item_dmenu.xml"
        "item_dnfpackages-${pkgver}.xml::${_urlraw}/resources/themes/default/item_dnfpackages.xml"
        "item_files-${pkgver}.xml::${_urlraw}/resources/themes/default/item_files.xml"
        "item_providerlist-${pkgver}.xml::${_urlraw}/resources/themes/default/item_providerlist.xml"
        "item_symbols-${pkgver}.xml::${_urlraw}/resources/themes/default/item_symbols.xml"
        "item_symbols_grid-${pkgver}.xml::${_urlraw}/resources/themes/default/item_symbols_grid.xml"
        "item_todo-${pkgver}.xml::${_urlraw}/resources/themes/default/item_todo.xml"
        "item_unicode-${pkgver}.xml::${_urlraw}/resources/themes/default/item_unicode.xml"
        "keybind-${pkgver}.xml::${_urlraw}/resources/themes/default/keybind.xml"
        "layout-${pkgver}.xml::${_urlraw}/resources/themes/default/layout.xml"
        "preview-${pkgver}.xml::${_urlraw}/resources/themes/default/preview.xml"
        "style-${pkgver}.css::${_urlraw}/resources/themes/default/style.css")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'bd91b255a3c5d36753f16b3b7bd201560a27292187fd87dc1d95b46e01aa6917'
            '5b4e47b7d2314bf8b2fda1e85d9e55126ef4a1f62a984f8e03f78ee6c74d63e6'
            'd6dac24c66c6e851e4a0f702154ccd92a1b0f64990beeff393b530ccd1089721'
            'ee18aeaa319a34b4f35e0445dadbe223f9f95532e0763aa6a44da03e3c4f6331'
            'e9613245a50e92f6da1e6f09bc84473fae716ee4c30b2536a4f0b285a1536c94'
            'e9613245a50e92f6da1e6f09bc84473fae716ee4c30b2536a4f0b285a1536c94'
            '6a3f108d419a8130c7b2b4726d5f49a166172fe319a486eb6bf8a0baaf3bef9b'
            'ece4a09405b837a6741879c64bbf3661ae080ffe928f3e4799c861f2f3b94e21'
            'b3597b72d3b51ecb9cec4aacd0d4a0629938e62e504fa60fdc6261fd092fea51'
            '4fe8af0457cdf1631ff3b6ac4ead13111e9044ab8071bcfe4dcbf48d0af0ff98'
            'e9613245a50e92f6da1e6f09bc84473fae716ee4c30b2536a4f0b285a1536c94'
            '8ded6a2cc65c1c8cb2390e272b27a2a6b33d265d8a1981acab09990400b0b3ae'
            '4de69a8744729c5a6521d062b541831046c6f06887ac30e22465c1f753764c00'
            '2fae16af71969dca54b04ba9e5356cf727ec7c383ddfdfafd6f502bf4b43705f'
            '03e6cf15e64e440cd91e643d75a00f77293bd45198fa8fe70eac37113e459efa'
            'f644e39d569bebdbca23b32e1b4ff90bfa3d296387079c6a42b3371a19b09439'
            '34ef99fced5e26a34a834e3edb2e4162823cafea1002f7c753522a05d59ef1fd'
            '1233d0b1a258dc1991fc7ad3abe764c40903e241312e994a3a17a75c985c13b7'
            '55106a1ce3b6a477fbaa04e50e7df367b0e242287f207f8fc7b6460f401dafd3'
            '073a912e3eee95249236af90ce50496a3b94bd840919b2d94e058054dbf3ca25'
            '5829f472a3a6fc664627cd16f7f867717bfd3d56c1612b75bf61eaf3d8a8961a')
sha256sums_x86_64=('eab433ca0f81b4fd2ab611bb00833c5b33df4c883475c763bb1d7337eb0908fb')

prepare() {
    cd "${srcdir}" || exit 1

    mkdir -p ./config
    for f in *.toml; do mv ${f} config/${f//-${pkgver}/} ; done

    mkdir -p ./themes
    for f in *.{xml,css}; do mv ${f} themes/${f//-${pkgver}/} ; done
}

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd "${srcdir}/config" || exit 1
    install -Dm644 config.toml -t "${pkgdir}/etc/xdg/${_pkgname}"

    cd "${srcdir}/themes" || exit 1
    for theme in ./*; do
        install -Dm644 ${theme} -t "${pkgdir}/etc/xdg/${_pkgname}/themes/default"
    done
}
