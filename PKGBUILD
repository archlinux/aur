# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abenz1267
_pkgname=elephant
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-websearch-bin ${_pkgname}-unicode-bin ${_pkgname}-todo-bin ${_pkgname}-symbols-bin ${_pkgname}-runner-bin ${_pkgname}-providerlist-bin ${_pkgname}-menus-bin ${_pkgname}-files-bin ${_pkgname}-desktopapplications-bin ${_pkgname}-clipboard-bin ${_pkgname}-calc-bin ${_pkgname}-archlinuxpkgs-bin ${_pkgname}-bluetooth-bin ${_pkgname}-windows-bin)
pkgver=2.4.0
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
            "${_pkgname}-windows: windows provider")

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
               "windows-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/windows-linux-${_barch[0]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '9ac86b2f362d5de128d0b577521b7361a517e81f06b78b57938550e45d0ef07d')
sha256sums_x86_64=('0e09c8b00fad595269a69c3ba1138a9247f3a0b57315eb05ba15e0ab029e6ed6'
                   '50d4646d459b3d948691f4f694b9cd9ec6862d5825bec5db1ad5320730a0e25d'
                   '873444fa296f9ccdca64cbecef0cadaa3c17d1d5aca180c1d67a27b151b80fa0'
                   '819729d7761560d90ea0d7d4a4dc1788ca419dc3f8319652775ae2cc282ec3c5'
                   'bba1ceb5baf1b3c56453cea7bed1c65451d2abeb702006bd02f33d8e698794f2'
                   '1c632ddf7fc9ebe146a4f4b64c49512c27ec41d194ae2bf2bd0d9ffd1c735910'
                   'a8d640c1b17f6e4f326833362be3e7d2fc278bc9198a2c0fe9326594e2d87220'
                   '50011092e7fed6f87afda624d07770cf6eea07ab3fe450d448dcfc74ca1673a4'
                   'b2f47eefcfaf331a590922255eea90ac3a8ecbec54e0fbbf24c03656a79a677a'
                   '3f454fc6975ae0879d64f66a6e858645d021d34e6122f4e69c38d3782a921bcb'
                   '582141ba3ad33bf1d702711759df0c3ecde87331c6e873c525800a2f128a8eba'
                   'd88fcf9ab70d75ec43120c8e450f5b7125a280b93da1fca8363aa2206ab9cb41'
                   '1a1099c5675f67bcf631109b1c87669dd1616667017e903419537ebe495e9e99'
                   '422b62a8296244f58d270f90b11fcc0a31af324b26765955b05e7f4d09e2c8f5'
                   '4b853baeb0bf8496e183fe4466d17ca80eb7447c56a948eb4d7d1c7620d86e57')

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
