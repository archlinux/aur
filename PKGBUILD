# Maintainer: William Penton <william@penton.us>

pkgname=gitkraken-cli
pkgver=1.5.0
pkgrel=1
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client."
url="https://www.gitkraken.com/"
provides=('gitkraken')
arch=('x86_64')
license=('custom')
optdepends=('git-lfs: git-lfs support'
            'org.freedesktop.secrets: Provides ways to store passwords and encryption keys')
makedepends=()
backup=()
install=''
source=(
    "${pkgname}-${pkgver}.zip::https://github.com/gitkraken/gk-cli/releases/download/v${pkgver}/gk_${pkgver}_Linux_x86_64.zip"
)
sha256sums=('d22ae6ac58e7f7f0dcc0bac50f342f49bb0e39089d63e13a7fe377285388bc7c')

package() {
    install -d "$pkgdir"/usr/local/bin
    cp -R "$srcdir"/gk "$pkgdir"/usr/local/bin/
}
