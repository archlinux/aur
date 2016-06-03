# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase="python-free-tls-certificates"
pkgname=("python-free-tls-certificates" "python2-free-tls-certificates")
pkgver=0.1.5
pkgrel=1
pkgdesc="A simple Python client library for ACME server that issues TLS (aka SSL) certificates"
url="https://github.com/mail-in-a-box/free_tls_certificates"
arch=('any')
license=('CC0')
source=("https://pypi.python.org/packages/9d/8b/41f560ce6754f98ff18eff1bb16df81bd2ea38fac3a1c571c26218963961/free_tls_certificates-0.1.5.tar.gz")
md5sums=('f64a969fd9b22d2e490941bb649241b1')

package_python-free-tls-certificates() {
    depends=("python-acme")
    cd "$srcdir/free_tls_certificates-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-free-tls-certificates() {
    depends=("python2-acme")
    cd "$srcdir/free_tls_certificates-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
