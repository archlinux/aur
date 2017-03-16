# Maintainer: dr34m/KarlFiabeschi 1984itsnow[at]gmail[dot]com

pkgname=keep
pkgver=2.1.3
pkgrel=1.2
pkgdesc="A Meta CLI toolkit : Personal shell command keeper"
arch=('any')
url="https://github.com/OrkoHunter/keep"
license=('MIT')
makedepends=('')
depends=('python-setuptools' 'python-click' 'python-requests' 'python-tabulate' )
source=("https://pypi.io/packages/source/k/keep/keep-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/OrkoHunter/keep/master/LICENSE.md")
md5sums=('9a452405588da649a17e539f4041e210' 
         'd88a347b3647d9938bdcdb68182c7315')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 "$srcdir"/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
