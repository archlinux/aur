# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=sv4git
pkgver=2.3.0
pkgrel=1
pkgdesc="Semantic version and conventional commits for git (git-sv)"
arch=('x86_64')
url="https://github.com/bvieira/sv4git"
license=('MIT')
depends=('git')
source=(
    "https://github.com/bvieira/sv4git/releases/download/$pkgver/git-sv_${pkgver}_linux_amd64.tar.gz")
b2sums=('8c7ecb6f52d9e14826db6e24758165579277b35f57d3042915cb4846c8a7684d153022b2acae89fb82dfcdf2387cdc888b98e7cce083f79ecee2095d8f3ff9ca')

package() {
    install -Dm755 $srcdir/git-sv $pkgdir/usr/bin/git-sv
}
