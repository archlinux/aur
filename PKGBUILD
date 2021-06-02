# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=sv4git
pkgver=2.2.1
pkgrel=1
pkgdesc="Semantic version and conventional commits for git (git-sv)"
arch=('x86_64')
url="https://github.com/bvieira/sv4git"
license=('MIT')
depends=('git')
source=(
    "https://github.com/bvieira/sv4git/releases/download/$pkgver/git-sv_${pkgver}_linux_amd64.zip")
b2sums=('91b03eac94c9201c2d88e630afbd4cb7bac31b0d675caf010e0cf32cfbbc09e8679d069748a61bcc4ed9e731c3ba87c61e2fc7edecb265d0e238570ae2f47153')

package() {
    install -Dm755 $srcdir/git-sv $pkgdir/usr/bin/git-sv
}
