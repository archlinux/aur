# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abenz1267
_pkgname=elephant
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-websearch-bin ${_pkgname}-unicode-bin ${_pkgname}-todo-bin ${_pkgname}-symbols-bin ${_pkgname}-runner-bin ${_pkgname}-providerlist-bin ${_pkgname}-menus-bin ${_pkgname}-files-bin ${_pkgname}-desktopapplications-bin ${_pkgname}-clipboard-bin ${_pkgname}-calc-bin ${_pkgname}-archlinuxpkgs-bin ${_pkgname}-bluetooth-bin)
pkgver=2.1.3
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="general purpose datasource and executor"

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("glibc")
optdepends=("${_pkgname}-providerlist: providerlist provider"
            "${_pkgname}-desktopapplications: desktopapplications provider"
            "${_pkgname}-archlinuxpkgs: archlinuxpkgs provider"
            "${_pkgname}-calc: calc provider"
            "${_pkgname}-clipboard: clipboard provider"
            "${_pkgname}-files: files provider"
            "${_pkgname}-menus: menus provider"
            "${_pkgname}-runner: runner provider"
            "${_pkgname}-symbols: symbols provider"
            "${_pkgname}-todo: todo provider"
            "${_pkgname}-unicode: unicode provider"
            "${_pkgname}-websearch: websearch provider"
            "${_pkgname}-bluetooth: bluetooth provider")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[0]}.tar.gz"
               "websearch-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/websearch-linux-${_barch[0]}.tar.gz"
               "unicode-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/unicode-linux-${_barch[0]}.tar.gz"
               "todo-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/todo-linux-${_barch[0]}.tar.gz"
               "symbols-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/symbols-linux-${_barch[0]}.tar.gz"
               "runner-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/runner-linux-${_barch[0]}.tar.gz"
               "providerlist-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/providerlist-linux-${_barch[0]}.tar.gz"
               "menus-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/menus-linux-${_barch[0]}.tar.gz"
               "files-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/files-linux-${_barch[0]}.tar.gz"
               "desktopapplications-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/desktopapplications-linux-${_barch[0]}.tar.gz"
               "clipboard-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/clipboard-linux-${_barch[0]}.tar.gz"
               "calc-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/calc-linux-${_barch[0]}.tar.gz"
               "archlinuxpkgs-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/archlinuxpkgs-linux-${_barch[0]}.tar.gz"
               "bluetooth-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/bluetooth-linux-${_barch[0]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '0a8e339b754aa6874408fe0c9af777271c8be086d7ccfc2732c1cac84f7b4311')
sha256sums_x86_64=('05d0703c9b7ed2566d5ed4bf829ad27588c90de19edfd00110aa2b93927f4c86'
                   '6039adc5e8990f030179bcfb997a88170de5d5b2c0c4155aeb6dbf635345de8c'
                   '2ef97e4b74e84a8519b4980d2052d7364f61a3e71070126d2cc3cb213a255cb1'
                   'ff00568f522c9dffad7aafbf0db4940f7b51cef1bf4dc4f85b6c68355cc6bfd1'
                   'b3264f05400b2a5fa1afd9ff255cc8a5620b5303b3fb7832aaff8a45dbcad775'
                   '4651e5c66644b3c5e03998df9b084792679ce5f33b83da743bee566f4da124a9'
                   '1fa6c16829978f971c4cbe89a40c2267ac6adaeac24ee7e9d00fa695c4baa10a'
                   '8d41279065484b37d13bb39750fc7567a938f51ba21a5249749accf5f470e33f'
                   '9fd186661408a3382976bd5e9e1fd5da5655e6d167f7d9a6aeb861f536d3d56b'
                   'e5634d252a5a83a442acb5289e6bae5659e53fee921b1683d26c6d636c8a05f1'
                   '323dc709af8a3f861286c27a4903510be72587b90b18891860681cd0f9ba6671'
                   '42ae3d150a707f7c915821289f04e00d5f05784ce63a269530a0c61e7ce13038'
                   '1d5586114a7dbc81b5e58f4fb64623cb7844076e9f57467d626ce75609e79513'
                   '030aaaef7f4ca542b8c4fbc037a666ed54bf7429ed2c884d329a9307dd54d17b')

case $CARCH in
    ${arch[0]})
        _CARCH=${_barch[0]}
        ;;
esac

package_elephant-bin() {
    cd "${srcdir}/" || exit

    install -Dm755 "${_pkgname}-linux-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-websearch-bin() {
    pkgdesc="websearch provider for ${_pkgname}"

    conflicts=("${_pkgname}-websearch")
    provides=("${_pkgname}-websearch")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "websearch-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/websearch.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-unicode-bin() {
    pkgdesc="unicode provider for ${_pkgname}"

    conflicts=("${_pkgname}-unicode")
    provides=("${_pkgname}-unicode")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "unicode-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/unicode.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-todo-bin() {
    pkgdesc="todo provider for ${_pkgname}"

    conflicts=("${_pkgname}-todo")
    provides=("${_pkgname}-todo")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "todo-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/todo.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-symbols-bin() {
    pkgdesc="symbols provider for ${_pkgname}"

    conflicts=("${_pkgname}-symbols")
    provides=("${_pkgname}-symbols")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "symbols-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/symbols.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-runner-bin() {
    pkgdesc="runner provider for ${_pkgname}"

    conflicts=("${_pkgname}-runner")
    provides=("${_pkgname}-runner")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "runner-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/runner.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-providerlist-bin() {
    pkgdesc="providerlist provider for ${_pkgname}"

    conflicts=("${_pkgname}-providerlist")
    provides=("${_pkgname}-providerlist")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "providerlist-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/providerlist.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-menus-bin() {
    pkgdesc="menus provider for ${_pkgname}"

    conflicts=("${_pkgname}-menus")
    provides=("${_pkgname}-menus")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "menus-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/menus.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-files-bin() {
    pkgdesc="files provider for ${_pkgname}"

    conflicts=("${_pkgname}-files")
    provides=("${_pkgname}-files")
    depends+=("${_pkgname}" "fd")

    cd "${srcdir}/" || exit

    install -Dm755 "files-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/files.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-desktopapplications-bin() {
    pkgdesc="desktopapplications provider for ${_pkgname}"

    conflicts=("${_pkgname}-desktopapplications")
    provides=("${_pkgname}-desktopapplications")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "desktopapplications-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/desktopapplications.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-clipboard-bin() {
    pkgdesc="clipboard provider for ${_pkgname}"

    conflicts=("${_pkgname}-clipboard")
    provides=("${_pkgname}-clipboard")
    depends+=("${_pkgname}" "wl-clipboard")

    cd "${srcdir}/" || exit

    install -Dm755 "clipboard-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/clipboard.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-calc-bin() {
    pkgdesc="calc provider for ${_pkgname}"

    conflicts=("${_pkgname}-calc")
    provides=("${_pkgname}-calc")
    depends+=("${_pkgname}" "libqalculate")

    cd "${srcdir}/" || exit

    install -Dm755 "calc-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/calc.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-archlinuxpkgs-bin() {
    pkgdesc="archlinuxpkgs provider for ${_pkgname}"

    conflicts=("${_pkgname}-archlinuxpkgs")
    provides=("${_pkgname}-archlinuxpkgs")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "archlinuxpkgs-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/archlinuxpkgs.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-bluetooth-bin() {
    pkgdesc="bluetooth provider for ${_pkgname}"

    conflicts=("${_pkgname}-bluetooth")
    provides=("${_pkgname}-bluetooth")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "bluetooth-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/bluetooth.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
