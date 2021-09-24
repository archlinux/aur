# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=sv4git
pkgver=2.5.0
pkgrel=1
pkgdesc="Semantic version and conventional commits for git (git-sv)"
arch=('x86_64')
url="https://github.com/bvieira/sv4git"
license=('MIT')
depends=('git')
source=(
    "https://github.com/bvieira/sv4git/releases/download/v$pkgver/git-sv_${pkgver}_linux_amd64.tar.gz")
b2sums=('e5469e55f844ce2ebd5fc4e99ec9b7149044f7a39f08ed500cf38d789dfd38457c0403abd4e5bbc6b1527a6f9f9a06598eb265d8a873d4a7678f902826bcba1c')

package() {
    install -Dm755 $srcdir/git-sv $pkgdir/usr/bin/git-sv
}
