# Maintainer: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributer: Paul Irish <http://paulirish.com/>

_pkgname=git-open
pkgname=git-open-git
pkgver=r200.4ca1990
pkgrel=1
pkgdesc='Type `git open` to open the GitHub page or website for a repository in your browser.'
arch=('x86_64')
url='https://github.com/paulirish/git-open'
license=('MIT')
depends=('git' 'xdg-utils')
conflicts=('nodejs-git-open' 'git-open')
source=('git://github.com/paulirish/git-open')
md5sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc"
  mkdir -p "${pkgdir}/usr/share/licenses"
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/${_pkgname}/${_pkgname}"
  install -Dm644 ${_pkgname}.1.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
