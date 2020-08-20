pkgname=python-free-tls-certificates
pkgver=0.1.6
pkgrel=1
pkgdesc="A simple Python client library for ACME server that issues TLS (aka SSL) certificates"
url="https://github.com/mail-in-a-box/free_tls_certificates"
arch=('any')
license=('CC0')
depends=("python-acme")
source=("https://pypi.python.org/packages/9b/a8/c8b267233f47f81537f4240e142359cc80fb6435f64e6488c6ad2d237050/free_tls_certificates-0.1.6.tar.gz")
md5sums=('c12d52d1ff7d305f35d252cbbffa878e')

package() {
    cd "$srcdir/free_tls_certificates-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
