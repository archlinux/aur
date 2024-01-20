# Maintainer: Matija Šuklje <matija@suklje.email>
pkgname=activity-aware-firefox
pkgver=0.4.2
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
sha256sums=('ccc7e72d8bcf0325b20c0e2b8827abe16aedc0483b1a1580891814da2af3d90e')

package() {
  cd "$pkgname-v$pkgver"
  pwd
  install -D --target-directory ${pkgdir}/usr/bin activityfirefox
  install -D --target-directory ${pkgdir}/usr/share/applications activityfirefox.desktop
}
