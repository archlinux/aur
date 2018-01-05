# Maintainer:   Maximilian Weiss    <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  James Lovejoy       <$(echo "Y29udGFjdEB2ZXJ0Y29pbi5vcmcK" | base64 -d)>

pkgname=python2-lyra2re2_hash
pkgver=1.1.2
pkgrel=1
pkgdesc='Bindings for Lyra2RE2 proof of work used by Vertcoin'

arch=('any')
url='https://github.com/metalicjames/lyra2re-hash-python'
license=('unknown')

depends=('python2-setuptools')

provides=('python2-lyra2re2_hash')
conflicts=('python2-lyra2re2_hash')

source=('git://github.com/metalicjames/lyra2re-hash-python')

sha256sums=('SKIP')

build() {
    cd "$srcdir/lyra2re-hash-python/"
    git checkout f0fa90423a1c564a1a3185418b05169b2c2222e1
}

package() {
    cd "$srcdir/lyra2re-hash-python/"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
