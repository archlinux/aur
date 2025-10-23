# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abenz1267
_pkgname=elephant
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-websearch-bin ${_pkgname}-unicode-bin ${_pkgname}-todo-bin ${_pkgname}-symbols-bin ${_pkgname}-runner-bin ${_pkgname}-providerlist-bin ${_pkgname}-menus-bin ${_pkgname}-files-bin ${_pkgname}-desktopapplications-bin ${_pkgname}-clipboard-bin ${_pkgname}-calc-bin ${_pkgname}-archlinuxpkgs-bin ${_pkgname}-bluetooth-bin ${_pkgname}-windows-bin ${_pkgname}-snippets-bin)
pkgver=2.6.0
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
            "${_pkgname}-snippets: snippets provider")

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
               "snippets-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/snippets-linux-${_barch[0]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'a502b8bf43bae2385e31a49c8f254867a90d3b82367040d3c5daf49a170b0724')
sha256sums_x86_64=('d2153df8e0d04596889e01a4d4edc111301cb6cf37bf0aa01df6978d5371d548'
                   '0920caf1b37d3fb4f977f6f52cca1d90236077da5009624db130223cbc891799'
                   'a4e268e4c8ad610cde4ea8bbd22f995b3b67f03ecea885eda0779cd4a3ec18ec'
                   'bca84f68d3234e367b122f7ed4fd99d5b422d824596e62a503ab69092bfab502'
                   'd68ef900b3128196d4affc0700daf93220a9d05946f211072a48e3f877be008a'
                   'b4161d54502aa2f121226ff5b31df7b4c15ad2cb2d69f45742aa4dcf56c65f1e'
                   '091742c8d934e7092519c7cf107b630405deac0b8c33de0f23f61d12103ef880'
                   'eb7c490f7d53be0539029473aeef5d7d570a68a80ac0ab81ec2078d5d80128a3'
                   'ba859fc4891a0f2562a8575c5ead72db0ad9cb969298ece8d91ecac653508f6b'
                   'd279c0984bcef3113d24ce80181748ad870356247cd346961d5be926ecb77321'
                   '4d81e3ff1c7eb806219afdb256beed7df8c4e59a460090c5108fc9fcbedd9c40'
                   'eeb70c9315a9090e8cdb323540ddc2059c897dd833d69f2e7ebc8c5561b42844'
                   'c597d31690552648fcdb8e67bdff264f24c31a4eab54cb63b8c90a32417f49e2'
                   '450b3f10e0e89b56301e6ebfe8cf2d9b57ff26a018e5b5a4cee7f9d125f57e33'
                   '8c6b73a86703173d5403f5c55821da53b7bc467a2665fd85bebb43be6052f2fa'
                   'beb3e197e2ffac05845c5ef2fb146299108997e17c9312e62a50200d1367dc41')

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
