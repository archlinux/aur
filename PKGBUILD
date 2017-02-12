# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=howdoi
pkgver=1.1.9
pkgrel=1
pkgdesc="A code search tool."
arch=(any)
url="https://github.com/gleitz/howdoi"
license=(MIT)
depends=('python2-pygments>=2.1.1'
         'python2-argparse>=1.4.0'
         'python2-cssselect>=0.9.1'
         'python2-lxml>=3.5.0'
         'python2-pyquery>=1.2.11'
         'python2-requests>=2.9.1'
         'python2-requests-cache>=0.4.11')
makedepends=(python-distribute)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("https://pypi.python.org/packages/23/2d/9790707eed08c802daee32183e7c98ec2e9797564dad229738b7f178e18e/${pkgname}-${pkgver}.tar.gz")
md5sums=('eaffe4f01cba6dbec769112a31b76cf4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
