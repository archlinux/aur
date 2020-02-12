# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python2-pyhockeystats
pkgver=0.2.0
pkgdate=20200212
pkgrel=1
pkgdesc="Just a test script dealing with hockey games and stats."
arch=('any')
url="https://github.com/GameMaker2k/Neo-Hockey-Test/"
license=('BSD')
replaces=('python2-hockeystats' 'python2-pyhockeystats')
depends=('python2')
options=(!strip !emptydirs)
_gitrevision='2d1c99c428b4c71c600a210dc2c2945ecbc96f5e'
source=("https://github.com/GameMaker2k/Neo-Hockey-Test/archive/${pkgdate}.tar.gz")
md5sums=('5e3cec9388a79569949e26490ba62803')
sha224sums=('25a2b18a1431b83f57c62ab6d05b4ec3761118cbc8c1d5baec6dafc6')
sha256sums=('ddc5f842c2ef63ecc51585af1e7f60e9e7164955694aa356ce4d5ce15e2a2e0b')
sha384sums=('310b7ff6bb6710445e73975050f39e8ddbad466bc45f79db5c7fd1cac1587caafbeb34aa2b1ab3b27d2fecd4eb0107e1')
sha512sums=('fa3ead1c399da54047ea8fb0d7adc74aa59bd634da2e9cfdf2d3a4ec49f4c16effa55b7ae94f4068dcee9ed5504a342f28190c8ed934c56041eeffc196b054d4')
b2sums=('096709710841778252ae33dc828a22a6acba6ed97576b18e32f35da138b9feaf1116abd20d1abeda7b60f133dd8bcba3b69133160ddf9a0574cf7fc9a49e6e66')

package() {
  cd "${srcdir}/Neo-Hockey-Test-${_gitrevision}"
  /usr/bin/python2 ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
