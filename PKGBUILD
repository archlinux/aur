# Maintainer: Poscat <poscat@mail.poscat.moe>

pkgname=emacs-markdown-preview-mode
pkgver=0.9.2
pkgrel=1
pkgdesc="Minor mode to preview markdown output as you save"
arch=('any')
url="https://github.com/ancane/markdown-preview-mode"
license=('MIT')
depends=('emacs')
makedepends=()
source=("https://github.com/ancane/markdown-preview-mode/archive/v${pkgver}.tar.gz")
noextract=('GPL3')
sha256sums=('7827f570005a4adc801878fc0a9679fbe015239701a6f8ff7eb6761dfbd15950')

build() {
    cd "${srcdir}/markdown-preview-mode-${pkgver}"
}

package() {
    cd "${srcdir}/markdown-preview-mode-${pkgver}"
    install -D -m 644 markdown-preview-mode.el "${pkgdir}"/usr/share/emacs/site-lisp/markdown-preview-mode.el
}
