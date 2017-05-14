# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=gixy
pkgver=0.1.4
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url=https://github.com/yandex/gixy
license=('custom:MPLv2')
depends=('python-argparse' 'python-cached-property' 'python-configargparse' 'python-jinja' 'python-pyparsing' 'python-six')
source=("gixy-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('350c7457f59b34ec5f43a763f0a16c9d8f6a3669a2d048aeccf8cebfaec87943325b3c67e2eb121d5b25ea9409e402a4116a0bc9b307f89d40d00712da47c501')

package() {
  cd gixy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
