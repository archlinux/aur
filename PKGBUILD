# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=kdeplasma-applets-fokus
_gitpkgname=focus-plasmoid
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple pomodoro KDE plasmoid"
arch=('any')
url="https://gitlab.com/divinae/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace')
source=("https://gitlab.com/divinae/$_gitpkgname/-/archive/v$pkgver/$_gitpkgname-v$pkgver.tar.gz")
sha512sums=('fe96ad0cad80a9372280fe4fb59a47e1747f8c2531cbc7710202de6a34228332b39cd2bdff220e18e6193b76cf4a0c9366d3d91547fe241af8e6eb719d534851')

package() {
  cd "$_gitpkgname-v$pkgver"
  mkdir -p "$pkgdir/usr/share/plasma/plasmoids/fokus/"
  cp -r package/* "$pkgdir/usr/share/plasma/plasmoids/fokus/"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
