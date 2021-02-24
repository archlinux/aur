# Maintainer 5amu <v.casalino@protonmail.com>

pkgname=zsh-minimal-prompt
pkgver=1.0
pkgrel=1
pkgdesc="Personal prompt design"
url="https://github.com/5amu/minimal-prompt/"
license=('MIT')
arch=('x86_64')
depends=('python3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/5amu/minimal-prompt/archive/${pkgver}.tar.gz")
sha256sums=("SKIP")

package() {
    cd $srcdir/minimal-prompt-$pkgver
    mkdir -p $pkgdir/usr/share/zsh/plugins/minimal-prompt
    install -Dm644 minimal-prompt.zsh $pkgdir/usr/share/zsh/plugins/minimal-prompt/minimal-prompt.zsh
}
