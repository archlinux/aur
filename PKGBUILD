# Maintainer: Matija Šuklje <matija@suklje.email>
pkgname=activity-aware-firefox
pkgver=0.4.1
pkgrel=1
pkgdesc="wrapper to make Firefox aware of Plasma Desktop activities"
arch=(any)
url="https://gitlab.com/hook/activity-aware-firefox"
license=('CC0-1.0')
groups=()
depends=('firefox' 'kdialog' 'gawk')
makedepends=()
optdepends=()
provides=()
conflicts=('activityfox-git')
replaces=()
backup=()
options=()
install=
changelog=
source=(https://gitlab.com/hook/activity-aware-firefox/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
noextract=()
sha256sums=('f3e75ce957565b614c1f642bf4c7f413f1931de83fb6b26f7f39e764206e9c2d')

package() {
  cd "$pkgname-v$pkgver"
  pwd
  install -D --target-directory ${pkgdir}/usr/bin activityfirefox
  install -D --target-directory ${pkgdir}/usr/share/applications activityfirefox.desktop
}
