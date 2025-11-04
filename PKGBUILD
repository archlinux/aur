# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abenz1267
_pkgname=elephant
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-websearch-bin ${_pkgname}-unicode-bin ${_pkgname}-todo-bin ${_pkgname}-symbols-bin ${_pkgname}-runner-bin ${_pkgname}-providerlist-bin ${_pkgname}-menus-bin ${_pkgname}-files-bin ${_pkgname}-desktopapplications-bin ${_pkgname}-clipboard-bin ${_pkgname}-calc-bin ${_pkgname}-archlinuxpkgs-bin ${_pkgname}-bluetooth-bin ${_pkgname}-windows-bin ${_pkgname}-snippets-bin ${_pkgname}-nirisessions-bin)
pkgver=2.14.0
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
            "${_pkgname}-bluetooth: bluetooth provider"
            "${_pkgname}-windows: windows provider"
            "${_pkgname}-snippets: snippets provider"
            "${_pkgname}-nirisessions: nirisessions provider")

options=(!strip)

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
               "bluetooth-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/bluetooth-linux-${_barch[0]}.tar.gz"
               "windows-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/windows-linux-${_barch[0]}.tar.gz"
               "snippets-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/snippets-linux-${_barch[0]}.tar.gz"
               "nirisessions-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/nirisessions-linux-${_barch[0]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'b7588cd186b1e534a5fafe14578f88685daae66abae7be582beead897df5d077')
sha256sums_x86_64=('f25c938fe47022a3878b10dbebd8aec85543291b2f95b278c1b8b232a4c50e50'
                   '3c14405ddc3ebdfad0e81bc2098b0582f722135617e032bde796ae6de086f149'
                   'c9dfa7544dd517c122868c544c66a9111b9e2131ff6f27d209877f19e5d1d78a'
                   'e953ab83363a8e32cef6ce89aa25741de06d6d26362f8ac8460a6fe6879789d0'
                   'dc033bc3128f07c3400406dcbcce8c356855abbd9db4084ca5284ecfcfc938dc'
                   '219bf72847f9a5dfeb0dc9269d01e6a70bc8743fc8129ac7e9ed276de44ac488'
                   '61ee4a16317aaa594512c2a16a043646faf3e78bd92ef1a1edbc9c75158fb726'
                   '4f853835b8a2da9fd538706e1833f6d9d61a6e64ff38d7da5dac26a0e8500320'
                   '8b217ee01aebff58f9b8c3362d26fb21e27d5e6f9e17a086cc7af7379dd3172d'
                   '12bef301fd71113f94e6b423060852221425da4030521b8cdcd15b515856e15c'
                   'bc5770827526185ac06d3791a19140d812d25b4b0944a9a0a49955c99d9aaab2'
                   '5303af48ad6ffc1a3034a663137131bbbbd258f6ee5a21d0fae680f5e5376df7'
                   'f00faeb189db04f0466e32e8e736f9836e629c40d8c45257f87d7aac0a215bbf'
                   '26a1d073a18ccdcf23c428f324f920bd5c7cd55b766e7b52806f84d9138c0038'
                   'f88284427776338cbd722552cecfed19425a6ca86f19a260d1eafc04bfb89ece'
                   '3274976ac2603da6902707eb73e8d0aa1ab1fef897137b28ae83b85b3594f972'
                   '72f3d80ac524e5a77b7518f0e458a8cec8a783394bbec4bc0aca1c498d6c5730')

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

package_elephant-windows-bin() {
    pkgdesc="windows provider for ${_pkgname}"

    conflicts=("${_pkgname}-windows")
    provides=("${_pkgname}-windows")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "windows-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/windows.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-snippets-bin() {
    pkgdesc="snippets provider for ${_pkgname}"

    conflicts=("${_pkgname}-snippets")
    provides=("${_pkgname}-snippets")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "snippets-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/snippets.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-nirisessions-bin() {
    pkgdesc="nirisessions provider for ${_pkgname}"

    conflicts=("${_pkgname}-nirisessions")
    provides=("${_pkgname}-nirisessions")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "nirisessions-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/nirisessions.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
