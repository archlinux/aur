# Submitter: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
# Maintainer: Vinícius dos Santos Oliveira <vini [dot] ipsmaker [at] gmail [dot] com>
pkgname=gkeyring
pkgver=0.3
pkgrel=2
pkgdesc="A small Python tool for shell access to GNOME keyring. It provides simple querying for and creating of keyring items."
arch=(i686 x86_64)
url="https://github.com/kparal/gkeyring"
license=('AGPL3')
depends=('python2' 'python2-gnomekeyring' 'python2-distribute')
options=(!emptydirs)
source=("https://github.com/kparal/gkeyring/archive/v${pkgver}.tar.gz")
md5sums=('d7de1937cd4542ef7fe7ddbf6e9b3b02')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
