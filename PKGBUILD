# Maintainer: Sondre Nilsen <echo "bmlsc2VuLnNvbmRyZUBnbWFpbC5jb20K" | base64 -d>

pkgname=git-ignore-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Quickly and easily list and fetch .gitignore templates from www.gitignore.io"
url="https://github.com/sondr3/git-ignore"
arch=('x86_64')
license=('GPL3')
provides=('git-ignore')
conflicts=('git-ignore')
source_x86_64=("https://github.com/sondr3/git-ignore/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha1sums_x86_64=('c11cdba8675c129142e9cb2fb3451b61f8f67320')

package() {
  install -Dm755 git-ignore "$pkgdir/usr/bin/git-ignore"
  install -Dm644 git-ignore.1 "$pkgdir/usr/share/man/man1/git-ignore.1"
}
