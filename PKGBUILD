# Maintainer: Troels Jacobsen <tkjacobsen@gmail.com>
pkgname=enote
pkgver=0.1.1
pkgrel=3
pkgdesc='Command line utility to backup Evernote notes and notebooks'
arch=(any)
url="https://github.com/tkjacobsen/$pkgname"
license=('MIT')
depends=('evernote-sdk-python'
         'python2-beautifulsoup4'
         'python2-html2text-git')
makedepends=('python2-setuptools')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('47cd145e3ac3cd92d24e4942aa4b2ff63c57118e1b0057b675b38c5ab022ae46')

package() {
	cd "$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/"
}

