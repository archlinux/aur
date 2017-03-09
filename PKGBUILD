# Maintainer: Adriaan Zonnenberg <amz@adriaan.xyz>

pkgname=git-open
pkgver=1.3.0
pkgrel=1
pkgdesc='Open a repo website (GitHub, GitLab, Bitbucket) in your browser'
arch=('any')
url='https://github.com/paulirish/git-open'
license=('MIT')
depends=('git' 'xdg-utils')
conflicts=('nodejs-git-open')
source=("https://github.com/paulirish/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c3a7f61743e995aa82bde7d466cfea52f4462f6f1af1e803a2aae1a1bc91ebc4')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 ./git-open "$pkgdir/usr/bin/$pkgname"
}
