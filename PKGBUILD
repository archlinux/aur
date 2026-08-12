# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=everhour-cli-bin
_pkgname=everhour-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="Everhour from the terminal — draft-first time tracking (CLI + TUI) (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Qu4tro/everhour-cli"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('everhour-cli')
conflicts=('everhour-cli' 'everhour-cli-git')
options=('!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Qu4tro/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/Qu4tro/$_pkgname/releases/download/v$pkgver/everhour-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
sha256sums=('21ae215f0f15a7359db88be7707fac1c548a6499526ac08c07096bd0426711b2')
sha256sums_x86_64=('bedeaaace57a32985b5e0765ce0d47b2ac9254151aeffd3438c799cb11bf0c1c')

package() {
  install -Dm755 everhour "$pkgdir/usr/bin/everhour"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
