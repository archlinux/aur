# Maintainer: Zach Noble <znoble360@gmail.com>
pkgname=gemini-cli-go-git
pkgver=0.7.0
pkgrel=1
pkgdesc="Terminal-based tool for interacting with Gemini written in Go"
url="https://github.com/eliben/gemini-cli"
arch=('x86_64')
license=('Unlicense')
makedepends=('git' 'go>=1.23.0')
depends=('glibc>=2.36') 
optdepends=('sqlite')
conflicts=('gemini-cli')
source=("git+https://github.com/eliben/gemini-cli.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/gemini-cli"
    go build
}

package() {
    cd "$srcdir/gemini-cli"
    install -Dm755 gemini-cli "$pkgdir/usr/bin/gemini-cli"
}
