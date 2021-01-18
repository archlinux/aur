pkgname="rpmspectool"
pkgver="1.99.7"
pkgrel="1"
pkgdesc="Utility for handling RPM spec files"
url="https://github.com/nphilipp/rpmspectool"
source=("https://files.pythonhosted.org/packages/source/r/rpmspectool/rpmspectool-$pkgver.tar.gz")
md5sums=("SKIP")
arch=('x86_64')
depends=('python-argcomplete' 'python-pycurl') 
makedepends=('python-setuptools')
build(){
    cd "$pkgname-$pkgver"
    python setup.py build 

}
package(){
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}