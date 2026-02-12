# Maintainer: Neolux Lee <aur.neolux@neolux.cn.eu.org>

pkgname=mingw-w64-dllcopy
pkgver=1.1
pkgrel=0
pkgdesc='A simple helper to copy dlls'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/neoluxis/mingw-w64-dllcopy'
depends=(
    'bash'
    'git'
)
source=("git+${url}.git")
sha256sums=('SKIP')
build() {
    chmod +x "${srcdir}/${pkgname}/dllcopy/dllcopy"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}/dllcopy/dllcopy" "${pkgdir}/usr/bin/x86_64-w64-mingw32-dllcopy"
    install -Dm755 "${srcdir}/${pkgname}/dllcopy/dllcopy" "${pkgdir}/usr/bin/i686-w64-mingw32-dllcopy"
}
