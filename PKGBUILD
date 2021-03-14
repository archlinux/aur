# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=kdeplasma-applets-fokus
_gitpkgname=focus-plasmoid
pkgver=1.4.2
pkgrel=1
pkgdesc="A simple pomodoro KDE plasmoid"
arch=('any')
url="https://gitlab.com/divinae/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace')
source=("https://gitlab.com/divinae/$_gitpkgname/-/archive/v$pkgver/$_gitpkgname-v$pkgver.tar.gz")
sha512sums=('f756370dde17869fd15129bcff0bb2c78db3a1580bbf6b935ed4ae9663d3346e467c222e4747c59c85f8c03c8ff5ed1d0e3e2f089b5d812456d005f0c05b089c')

package() {
  cd "$_gitpkgname-v$pkgver"
  mkdir -p "$pkgdir/usr/share/plasma/plasmoids/fokus/"
  cp -r package/* "$pkgdir/usr/share/plasma/plasmoids/fokus/"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
