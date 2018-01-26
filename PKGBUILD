# Maintainer: Adriaan Zonnenberg <amz@adriaan.xyz>

pkgname=git-open
pkgver=2.0.0
pkgrel=1
pkgdesc='Open a repo website (GitHub, GitLab, Bitbucket) in your browser'
arch=('any')
url='https://github.com/paulirish/git-open'
license=('MIT')
depends=('git' 'xdg-utils')
conflicts=('nodejs-git-open')
source=("https://github.com/paulirish/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('70629da6202353399083dec21b1ef6f63985bc5c2b4f141bd044116236ade42d')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 ./git-open "$pkgdir/usr/bin/$pkgname"
}
