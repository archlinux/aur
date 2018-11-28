# Maintainer: Adam Papai <wooh@wooh.hu>

pkgname=git-remind
pkgver=1.1.1
pkgrel=1
pkgdesc='A command line tool that prevent you to forget git-commit and git-push.'
arch=('x86_64')
url='https://github.com/suin/git-remind'
license=('GPL')
provides=("${pkgname}")
sha256sums=('abdeefe18c5bc074e9dd3766996a956d32eb33fcc22c456ea1f4fc2df00cb17b')
source=("$pkgname-$pkgver.tar.gz::https://github.com/suin/git-remind/releases/download/v${pkgver}/git-remind_${pkgver}_Linux_${arch}.tar.gz")
depends=()

package() {
    cd "$srcdir"
    mkdir -p ${pkgdir}/usr/bin
    install -m0755 git-remind "$pkgdir/usr/bin/git-remind"
}
