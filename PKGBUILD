# Submitter: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
# Contributor: Vinícius dos Santos Oliveira <vini [dot] ipsmaker [at] gmail [dot] com>
# Maintainer: Daniel Landau <daniel@landau.fi> 
pkgname=gkeyring
pkgver=0.4
pkgrel=1
pkgdesc="A small Python tool for shell access to GNOME keyring. It provides simple querying for and creating of keyring items."
arch=(i686 x86_64)
url="https://github.com/kparal/gkeyring"
license=('AGPL3')
depends=('python2' 'python2-gnomekeyring' 'python2-distribute')
options=(!emptydirs)
source=("https://github.com/kparal/gkeyring/archive/v${pkgver}.tar.gz")
md5sums=('07ff172804600766b308a90d4c0a1c82')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
