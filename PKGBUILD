# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=gixy
pkgver=0.1.3
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url=https://github.com/yandex/gixy
license=('custom:MPLv2')
depends=('python-argparse' 'python-cached-property' 'python-configargparse' 'python-pyparsing' 'python-six')
source=("gixy-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e135562712c4aad5eed1b85ecc88e447ef1eaee891fd50d301ca5d8ba48b9c023313553c3ec88641639722b794980735812f3d5201d64c264e999cd3c66df108')

package() {
  cd gixy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
