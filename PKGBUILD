# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=kdeplasma-applets-fokus
_gitpkgname=focus-plasmoid
pkgver=1.5.4
pkgrel=1
pkgdesc="A simple pomodoro KDE plasmoid"
arch=('any')
url="https://gitlab.com/divinae/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace')
source=("https://gitlab.com/divinae/$_gitpkgname/-/archive/v$pkgver/$_gitpkgname-v$pkgver.tar.gz")
sha512sums=('aa3093b8078a46a5c1477ed4027021dc26c3d73bc6763ed3fef528063f0feb661d5e06a169d0476f246b58a1e754a6bfc3439eb73a663dd2a40d60be6aa56565')

package() {
  cd "$_gitpkgname-v$pkgver"
  mkdir -p "$pkgdir/usr/share/plasma/plasmoids/fokus/"
  cp -r package/* "$pkgdir/usr/share/plasma/plasmoids/fokus/"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
