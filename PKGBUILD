# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma5-applets-fokus
_oldpkgname=kdeplasma-applets-fokus
_gitpkgname=focus-plasmoid
pkgver=1.5.5
pkgrel=2
pkgdesc="A simple pomodoro KDE plasmoid"
arch=('any')
url="https://gitlab.com/divinae/focus-plasmoid"
license=('GPL')
depends=('plasma-workspace')
conflicts=("$_oldpkgname")
replaces=("$_oldpkgname")
source=("https://gitlab.com/divinae/$_gitpkgname/-/archive/v$pkgver/$_gitpkgname-v$pkgver.tar.gz")
b2sums=('ce5d57d6a8746cda00a7fe0b5474e5d2af4dbccfc053e731408d91e31497bc9f790e25e986e79c750c3d8957929fc39c8991735b31154668b05690b26936b879')

package() {
    cd "$_gitpkgname-v$pkgver"
    mkdir -p "$pkgdir/usr/share/plasma/plasmoids/fokus/"
    cp -r package/* "$pkgdir/usr/share/plasma/plasmoids/fokus/"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
