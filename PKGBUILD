pkgname=google-translate
pkgver=0.3
pkgrel=1
pkgdesc="A simple CLI google translator (command-line)."
arch=('any')
url="http://dun.ai"
license=('GPL2')
depends=('python2' 'python2-mechanize' 'python2-beautifulsoup4')
options=('!strip')
source=('http://public.dun.ai/public/google-translate/google-translate')

package() {
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

md5sums=('7b5a5bd4b68bbd536c11bb0b4a7f84e4')
