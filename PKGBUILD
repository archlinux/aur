# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python-pyupcean
pkgver=2.7.18
pkgrel=1
pkgdesc="PyUPC-EAN is a barcode library/module for python3."
arch=('any')
url="https://github.com/GameMaker2k/PyUPC-EAN/"
license=('BSD')
replaces=('python-upcean' 'python-pyupcean')
depends=('python' 'python-pillow')
options=(!strip !emptydirs)
_gitrevision='929fe1deb99333cb4f000933e70ca36adbd97ca1'
source=("https://github.com/GameMaker2k/PyUPC-EAN/archive/${pkgver}.tar.gz")
md5sums=('15d52a4911dcf0cf5f0628e4ae765277')
sha224sums=('d5db120d9d0aa4944d60e3ee7bee7e39911d10458fdb74dbae2c4cc0')
sha256sums=('63fd8d437cdac2b46994cd373baf5fb4e9ade9c7454b4cea85a9a2456fd7e94a')
sha384sums=('0eb4846d80d1b6efe0a6d0f077af21a1c7c030ca8f9cd6961ede007814388e2e9b1c7eac377cb59d87d19a5183c55c54')
sha512sums=('dfe89e72233e9af521980d6c473759a9a289f82a96336c4049a122ace2862c53c1fddb3cff9383b115f14f147ed8b4c4b725c497cfcedc25aeea4cd4519641f5')
b2sums=('0d8a42760077efffd52c5b4a52c64af86c168abef8226454b9d1d894b283836d3122025d7e3a80b6741f28f234299298eefcef67a094ef0b58620ffdfca634bf')

package() {
  cd "${srcdir}/PyUPC-EAN-${_gitrevision}"
  /usr/bin/python ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
