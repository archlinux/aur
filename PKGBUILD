pkgbase=('wrld')
pkgname=('wrld')
_module='wrld'
pkgver='1.0'
pkgrel=1
pkgdesc="simplified bash loops (or, xargs -I on steroids)"
url="https://github.com/ninjaaron/wrld"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/77/8a/c175a78cc6c5a9745df8fa05bd2f5b3ef483ef8f927a549747a18a464803/wrld-1.0.tar.gz")
md5sums=('9ca7e0007d4d0509d75853cadedbac9d')

build() {
    cd "${srcdir}/wrld-1.0"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/wrld-1.0"
    pip3 install --ignore-installed --root="${pkgdir}" "wrld"*.whl
}
