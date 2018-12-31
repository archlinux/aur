# Maintainer:   Maximilian Weiss    <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  James Lovejoy       <$(echo "Y29udGFjdEB2ZXJ0Y29pbi5vcmcK" | base64 -d)>

pkgname=python-lyra2re2_hash
pkgver=1.2.1
pkgrel=1
pkgdesc='Bindings for Lyra2RE2 proof of work used by Vertcoin'

arch=('any')
url='https://github.com/metalicjames/lyra2re-hash-python'
license=('unknown')

depends=('python-setuptools')

provides=('python-lyra2re2_hash')
conflicts=('python-lyra2re2_hash')

source=('git://github.com/metalicjames/lyra2re-hash-python')

sha256sums=('SKIP')

build() {
    cd "$srcdir/lyra2re-hash-python/"
    git checkout 639567bf3674730362fafbb8ae90c35bcf94b42a
}

package() {
    cd "$srcdir/lyra2re-hash-python/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}

