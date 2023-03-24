# Maintainer: Voronwe Sul <mail@voronwe.me>

pkgname=emphasize-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A command line tool to highlight lines that match a pattern"
arch=('x86_64')
url="https://github.com/bronvic/emphasize"
license=('MIT')
depends=()
source=("https://github.com/bronvic/emphasize/releases/download/v${pkgver}/emphasize")
sha256sums=('8c8a38b905afd0614111f42b28ad16e5e940ccd2a07d4ea6035b47716524c138')

package() {
  install -Dm755 "${srcdir}/emphasize" "${pkgdir}/usr/bin/emph"
}
