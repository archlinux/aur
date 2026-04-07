# Maintainer: Yasir Peker <yasirzengin10@gmail.com>
pkgname=gquick-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A tiny tool to add, commit, and push to git with a single command."
arch=('any')
url="https://github.com/YOUR_GITHUB_USERNAME/gquick"
license=('MIT')
depends=('git' 'bash')
makedepends=('git')
source=("git+https://github.com/YOUR_GITHUB_USERNAME/gquick.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/gquick"
    # Dosyayı /usr/bin altına 'gquick' ismiyle kurar
    install -Dm755 gquick "$pkgdir/usr/bin/gquick"
}
