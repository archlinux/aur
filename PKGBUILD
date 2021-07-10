# Maintainer: Sondre Nilsen <echo "bmlsc2VuLnNvbmRyZUBnbWFpbC5jb20K" | base64 -d>

pkgname=git-ignore-bin
pkgver=1.1.2
pkgrel=0
pkgdesc="Quickly and easily list and fetch .gitignore templates from www.gitignore.io"
url="https://github.com/sondr3/git-ignore"
arch=('x86_64')
license=('GPL3')
provides=('git-ignore')
conflicts=('git-ignore')
source_x86_64=("https://github.com/sondr3/git-ignore/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('314c4e47723b79fc4b9973219db43187a4abf3d5d2c3c83cfa23abc669c404a9')

package() {
  install -Dm755 git-ignore "$pkgdir/usr/bin/git-ignore"
  install -Dm644 git-ignore.1 "$pkgdir/usr/share/man/man1/git-ignore.1"
}
