# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=sv4git
pkgver=2.4.0
pkgrel=1
pkgdesc="Semantic version and conventional commits for git (git-sv)"
arch=('x86_64')
url="https://github.com/bvieira/sv4git"
license=('MIT')
depends=('git')
source=(
    "https://github.com/bvieira/sv4git/releases/download/v$pkgver/git-sv_${pkgver}_linux_amd64.tar.gz")
b2sums=('a2b8e35a4cbfc21d1dcecf238311efe4168b3085b44eb6c626b24e6b65146a2a9d4edf577ba3908429e683c0ce46307bb9fc019bdfa57c4c202b6f8f3f8d1302')

package() {
    install -Dm755 $srcdir/git-sv $pkgdir/usr/bin/git-sv
}
