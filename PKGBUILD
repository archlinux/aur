# Maintainer: Sathyam Vellal <mail@sathyamvellal.in>
pkgname=shenv
pkgver=1.2
pkgrel=2
pkgdesc="A set of scripts to create custom shell environments for different activities"
url="http://sathyamvellal.in/shenv"
arch=('any')
license=('MIT')
optdepends=('zsh')
makedepends=()
conflicts=()
replaces=()
backup=()
install='shenv.install'
source=("https://github.com/sathyamvellal/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('0486b9f9a213fd0dd2af725a4dec5856')

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    install -Dm644 "bash/shenvrc" "$pkgdir/usr/share/${pkgname}/bash/shenvrc"
}
