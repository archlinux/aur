pkgname=google-translate
pkgver=0.2
pkgrel=3
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

md5sums=('c2dae6294c95cf55c39ba7b68c5ff6f1')
