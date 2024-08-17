# Maintainer: Dwayne B. Bent <dbb@dbb.dev>
pkgname=btop-theme-catppuccin
pkgver=1.0.0
pkgrel=1
pkgdesc='Soothing pastel theme for btop'
arch=('any')
depends=('btop')
url='https://github.com/catppuccin/btop'
license=('MIT')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/catppuccin/btop/releases/download/${pkgver}/themes.tar.gz"
)
b2sums=('c63aa3250653d94b088f7dfbeb8c6efc86b863c7dbe44277b4948b9a3a0b52f008ad1846f7bbf78b19a4df0b0a7f0a61fe5c8bd25de6b5215735b7ab9870fdef')

package() {
    install -d "${pkgdir}/usr/share/btop/themes"
    install "${srcdir}"/themes/*.theme "${pkgdir}/usr/share/btop/themes"
}
