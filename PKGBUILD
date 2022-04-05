# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>
pkgname=python-httpstan
pkgver=4.7.2
pkgrel=1
pkgdesc="HTTP-based REST interface to Stan, a package for Bayesian inference."
arch=('i686' 'x86_64')
url='https://httpstan.readthedocs.org'
license=(ISCL)
depends=(python-numpy python-marshmallow python-webargs python-setuptools python-appdirs python-aiohttp)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/25/66/702bd3793c1593590635ae0d54192c3f767071b829136106fab7f037b0aa/httpstan-4.7.2-cp310-cp310-manylinux_2_24_x86_64.whl")
sha256sums=('89836d6126bd2dcb9eecd691be18fcbd5db2fa146766a4718ad96e1e72edb4f9')

# skipping build as the package is only distrbutted as a wheel

package() {
    python -m install --destdir="$pkgdir" *.whl
}