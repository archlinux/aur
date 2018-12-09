pkgname=python-u2flib-host
pkgver=3.0.3
pkgrel=1
pkgdesc='Python-based U2F host library by Yubico'
arch=(any)
url='https://github.com/Yubico/python-u2flib-host'
license=(BSD)
depends=(python python-hidapi)
makedepends=(python python-pip)

package() {
    PIP_CONFIG_FILE=/dev/null \
        pip install \
        --isolated \
        --root="$pkgdir" \
        --ignore-installed \
        --no-deps \
        "${pkgname}==${pkgver}"
}
