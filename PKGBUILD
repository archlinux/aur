pkgname=python-i686-bin
pkgdesc="Major release 3.11 of the Python high-level programming language (32-bit)"
pkgver=3.11.8
pkgrel=3
arch=('x86_64')
url="https://www.python.org/"
license=('PSF-2.0')
options=('!debug')
depends=('glibc' 'zlib' 'bzip2' 'openssl' 'libffi')
source=("https://github.com/shdwmtr/pybuilder/releases/download/v1.0.5/python-3.11.8-32-bit.tar.gz")
sha256sums=('10af38d15eefc7ea55cc794444dfcf456e38f0f2883dc8e168ccc7d44555abfc')

package() {
    cd "$srcdir"
    
    # Create necessary directories
    install -dm755 "$pkgdir/opt/python-i686-$pkgver"
    install -dm755 "$pkgdir/usr/bin"

    # Extract and move files
    tar -xf "python-3.11.8-32-bit.tar.gz"
    mv bin "$pkgdir/opt/python-i686-$pkgver/"
    mv lib "$pkgdir/opt/python-i686-$pkgver/"
}
