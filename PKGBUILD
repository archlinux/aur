pkgname=google-translate-git
pkgver=0.2
pkgrel=2
pkgdesc="A simple CLI google translator (command-line)."
arch=('any')
url="http://dun.ai"
license=('GPL')
depends=('python2' 'python2-mechanize' 'python2-beautifulsoup4')
source=(google-translate::git://github.com/google-translate.git)

package() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

md5sums=('5c1ab8eaca293ed22280c7844bb9d29d')
