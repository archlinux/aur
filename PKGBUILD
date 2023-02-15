# Maintainer: Danilo Carolino <danilogcarolino@gmail.com>

_gitbranch=main
_gitauthor=devemio
pkgname=docker-color-output-git
pkgver=2.2.0
pkgrel=20
pkgdesc="Colors for Docker CLI"
arch=('x86_64')
license=('MIT')
url="https://github.com/${_gitauthor}/${pkgname%-git}"
source=("docker-color-output::https://github.com/${_gitauthor}/${pkgname%-git}/releases/download/v${pkgver}/${pkgname%-git}-linux-amd64")
sha512sums=('SKIP')
makedepends=("go" "git")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
options=("!lto")

package() {
  install -Dm 755 "$srcdir/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  #install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
