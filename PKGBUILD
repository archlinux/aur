# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=sv4git
pkgver=2.7.0
pkgrel=1
pkgdesc="Semantic version and conventional commits for git (git-sv)"
arch=('x86_64')
url="https://github.com/bvieira/sv4git"
license=('MIT')
depends=('git')
source=(
    "https://github.com/bvieira/sv4git/releases/download/v$pkgver/git-sv_${pkgver}_linux_amd64.tar.gz")
b2sums=('de376d04cc8b0f0026e5b67420ee61e23a9d76eea28683dc5735abe32a1bad63a8b1f5e398f9fc06d23a6abe51a5682466d4d399f211cb1f7b6dbf2d5d795f67')

package() {
    install -Dm755 $srcdir/git-sv $pkgdir/usr/bin/git-sv
}
