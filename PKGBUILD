# Maintainer: Wainer Vandelli <wainer dot vandelli at gmail dot com>
pkgname=auth-get-sso-cookie
pkgver=2.2.0
pkgrel=1
pkgdesc="auth-get-sso-cookie acquires CERN Single Sign-On cookie using Kerberos credentials allowing for automated access to CERN SSO protected pages using tools alike wget, curl or similar."
arch=("any")
url="https://gitlab.cern.ch/authzsvc/tools/auth-get-sso-cookie"
license=("MIT")
depends=("python-requests-gssapi")
makedepends=("python-installer")
_name=$pkgname
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('0e0668fb71339f0150d71248200c847ede3e60d0dac5fa15f4ace9caa4b613aa')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" *.whl
}

