# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=14.5.14
pkgrel=1
pkgdesc="AI Coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more (release binary)"
arch=('x86_64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
provides=("oh-my-pi")
conflicts=("oh-my-pi")
options=('!strip')
source=("omp-${pkgver}::https://github.com/can1357/oh-my-pi/releases/download/v${pkgver}/omp-linux-x64"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/can1357/oh-my-pi/v${pkgver}/LICENSE")
sha256sums=('d36e4c12c97dba7a2c382c80e984c226187706e60e2b4c87eaf655b1988fdf78'
            '545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')

package() {
    install -Dm755 "${srcdir}/omp-${pkgver}" "${pkgdir}/usr/bin/omp"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
