# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinx.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=xpenguins_themes
pkgver=1.0
pkgrel=1
pkgdesc="XPenguins Themes"
arch=('any')
url="http://xpenguins.seul.org"
license=('unknown')
depends=('xpenguins')
source=(http://xpenguins.seul.org/$pkgname-$pkgver.tar.gz)
sha256sums=('d6aeee8c7b0c5a02b187cbe1d781341576d711a25f837c75e11f997a92e9a957')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/xpenguins"
  cp -r themes "${pkgdir}/usr/share/xpenguins/themes/"
}
