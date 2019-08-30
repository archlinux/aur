# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=markdown2ctags
pkgver=0.2.5
pkgrel=2
pkgdesc="Generate ctags-compatible tags files for Markdown documents"
arch=('any')
depends=('python')
url="https://github.com/jszakmeister/markdown2ctags"
license=('BSD3')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/jszakmeister/$pkgname/tar.gz/v$pkgver")
sha256sums=('592619871396bcbb2cd16332cf4392cb2e7b593f5a914658c696763abe391ba4')

package() {
  cd "$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/markdown2ctags"

  msg2 'Installing documentation...'
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/markdown2ctags"

  msg2 'Installing...'
  install -Dm 755 markdown2ctags.py "$pkgdir/usr/bin/markdown2ctags"
}
