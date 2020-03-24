# Contributor: pianoslum <pianoslum@mailbox.org>
pkgname=ofxstatement-de-triodos
pkgver=r14.8aef762
pkgrel=1
pkgdesc="Plugins for ofxstatement for German Triodos and GLS accounts"
arch=('any')
url="https://github.com/pianoslum/ofxstatement-de-triodos"
license=('GPL')
depends=('ofxstatement')
makedepends=('git')
source=('git+https://github.com/pianoslum/ofxstatement-de-triodos')
md5sums=('SKIP')

pkgver() {
      cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    }

package() {
      cd "$srcdir/${pkgname%-git}"
        python setup.py install --root="$pkgdir" --optimize=1
    }

