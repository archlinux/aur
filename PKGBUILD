# A lightweight CLI tool to compile and run PL's instantly.
# Maintainer: Yasir Peker <yasirzengin10@gmail.com>
pkgname=qrun-code-git
_pkgname=qrun
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight CLI tool to compile and run C, C++, Python, and Go instantly."
arch=('any')
url="https://github.com/lanierc/qrun"
license=('MIT')
depends=('gcc' 'python' 'go')
makedepends=('git')
source=("git+https://github.com/lanierc/qrun.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 qrun.sh "$pkgdir/usr/bin/qrun"
}
