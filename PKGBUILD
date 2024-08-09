pkgname=hardcpy-bin
pkgver=v0.2.0
pkgrel=1
pkgdesc="Simple backup tool written in Rust"
url="https://github.com/obvMellow/hardcpy"
license=(GPL-3.0-or-later)
arch=('x86_64')
conflicts=('hardcpy-git')
source=("https://github.com/obvMellow/hardcpy/releases/download/${pkgver}/hardcpy")
sha256sums=('38815c6ae0961ddb0f15c54de78f661b4c0e90d349dd76d02fd7416b464f6554')

package() {
    cd "${srcdir}"
    install -Dm755 "hardcpy" "${pkgdir}/usr/bin/hardcpy"
}
