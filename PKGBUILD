# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python2-pyhockeystats
pkgver=0.1.0
pkgdate=20200127
pkgrel=1
pkgdesc="Just a test script dealing with hockey games and stats."
arch=('any')
url="https://github.com/GameMaker2k/Neo-Hockey-Test/"
license=('BSD')
replaces=('python2-hockeystats' 'python2-pyhockeystats')
depends=('python2')
options=(!strip !emptydirs)
_gitrevision='57e2f4f5e3edc525abe6cfda75b7b701a629fea2'
source=("https://github.com/GameMaker2k/Neo-Hockey-Test/archive/${pkgdate}.tar.gz")
md5sums=('d5629b73d09bca11bdcd48188bebba11')
sha224sums=('802c12af6df3016d4dcb5b8809308304ad53cdb779f6c5a9816d9c22')
sha256sums=('63369fdb05cce3bbb1f36a04221e542bbcba50d4f105730fcab3b23694cb8d95')
sha384sums=('5422c658d8d67bfa54f9336f43cbd9533e69d0a3584c4008b98c3b724e52d0b96e1aade12d750118a37c06fdb116e6b3')
sha512sums=('f9047aca8fa68a8d1d508ad3243c5c7f4ec03203be5a397a6d253a2bf48a4d6a237082ba05c58ecc82e0ca58f3a6bcb56938c49f62229bcbcffe41072f52894f')
b2sums=('45e340196eac0e4a0efffac1374577b1b66ee26e6760a5957ab1825146f74250a034016e772e0ae6a238a5404b75707eabd9ade0acc653eaa7a6483fd89325b6')

package() {
  cd "${srcdir}/Neo-Hockey-Test-${_gitrevision}"
  /usr/bin/python2 ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
