# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-bin
pkgver=15.11.0
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
sha256sums=('7a457d07aaa5e62ca3c8a55ad72833cdde46f28102c9c87b1157f6069ad8a34f'
            '545636e19386d3d4e0ae6d77354527499999c3ebfbca61b9fa5aa4ead7c0b308')

package() {
    install -Dm755 "${srcdir}/omp-${pkgver}" "${pkgdir}/usr/bin/omp"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
