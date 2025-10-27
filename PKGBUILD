# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abenz1267
_pkgname=elephant
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-websearch-bin ${_pkgname}-unicode-bin ${_pkgname}-todo-bin ${_pkgname}-symbols-bin ${_pkgname}-runner-bin ${_pkgname}-providerlist-bin ${_pkgname}-menus-bin ${_pkgname}-files-bin ${_pkgname}-desktopapplications-bin ${_pkgname}-clipboard-bin ${_pkgname}-calc-bin ${_pkgname}-archlinuxpkgs-bin ${_pkgname}-bluetooth-bin ${_pkgname}-windows-bin ${_pkgname}-snippets-bin ${_pkgname}-nirisessions-bin)
pkgver=2.7.7
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
            '22c48fb3478f4344ce76dbc061716d8ced770645e9009167a4ae2f1126aaf424')
sha256sums_x86_64=('34f59f56f4ade344e3c9daeb45015dffe1d1d5a3c3a8a45d53b1a6cf84697b0e'
                   '69a787c28bae55814a847187e9523607c02f6b72b5d14d4a56e172b2c7478d0d'
                   '0853444024f9eb98e662613cccf1388d2c587b807457e53d3456e464d41d3335'
                   '7db8ba7e521f547cbc4541ee4205b2321f560052cbb0f476afcaf7b62259223a'
                   'b905cfa508541871ba955b40fa79b04b78f7edeef2d2a5ec95ff162df4e18632'
                   '283dfb33c52cb3d22c9c20c5cb0f8a3a75bec35fee77508d169544cdabc6b4eb'
                   'a050e36fbaace36ea7fe359825927a4bb958289805e77092d3548e264e882c37'
                   'cd6a599b3ddee59aa69e7e6d763d3e1453a95980a9f2576ec3ce1ff347beed84'
                   'f0d3e6d6b1f251d12b487c424ad1f96089d9015ccc820e8668301fb1cae69d40'
                   '2a41d04a974335f28fa4c4df3715a5c4cb0afba666825f480b061b9b026326e6'
                   '84b270f52e49a9f38dea77c82ee647aa89a7dd65650985b2ee03a024a795c876'
                   '8f1619b773972ff191c74105f4604bcbfe16693529d34044b1a37e954bffa803'
                   'af952ac1ad780b37c6588e519543b7d2c6d8dd18516ecce0ec4f27052cf7d2a8'
                   '409fa3159041b3926bb75bf209b0ee74f26e847eca1c8110f64a6dddf43b74c0'
                   'a651a93720ef0e2cecc95d99693877cdd337370b8b5f7829a85913f00a04c0ed'
                   '5d190d8083d10d175ae7a6a795aeaffb2207be65180b023ab024d0696fe121c1'
                   '5dfde8a5ecb42f5a5879c1ae25f5d561047ba88656a0c1828285f2fc591fe702')

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
