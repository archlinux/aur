# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=sv4git
pkgver=2.8.0
pkgrel=1
pkgdesc="Semantic version and conventional commits for git (git-sv)"
arch=('x86_64')
url="https://github.com/bvieira/sv4git"
license=('MIT')
depends=('git')
source=(
    "https://github.com/bvieira/sv4git/releases/download/v$pkgver/git-sv_${pkgver}_linux_amd64.tar.gz")
b2sums=('feae6ed52c930318a74d940a426ef49e77c58a37c479eaceb52633ae28c35673ed87ed68551827f3f6ed23f7146d5454017ea08c7b0971795d68347f112a35cc')

package() {
    install -Dm755 $srcdir/git-sv $pkgdir/usr/bin/git-sv
}
