# Maintainer: Adriaan Zonnenberg <amz@adriaan.xyz>

pkgname=git-open
pkgver=1.3.1
pkgrel=1
pkgdesc='Open a repo website (GitHub, GitLab, Bitbucket) in your browser'
arch=('any')
url='https://github.com/paulirish/git-open'
license=('MIT')
depends=('git' 'xdg-utils')
conflicts=('nodejs-git-open')
source=("https://github.com/paulirish/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('12463f3dc586db703c4612ed12160e2a23336ade0c8fba34798bd741a3cf3a3c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 ./git-open "$pkgdir/usr/bin/$pkgname"
}
