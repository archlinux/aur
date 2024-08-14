pkgname=hardcpy-bin
pkgver=v0.2.1
pkgrel=1
pkgdesc="Simple backup tool written in Rust"
url="https://github.com/obvMellow/hardcpy"
license=(GPL-3.0-or-later)
arch=('x86_64')
conflicts=('hardcpy-git')
source=("https://github.com/obvMellow/hardcpy/releases/download/${pkgver}/hardcpy")
sha256sums=('24b0cee726cf86fe6659d8c6b8766fdb86a31cd6ab37d06e97f8b9ddb19d2de4')

package() {
    cd "${srcdir}"
    install -Dm755 "hardcpy" "${pkgdir}/usr/bin/hardcpy"
}
