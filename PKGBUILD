# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python-pyhockeystats
pkgver=0.4.0
pkgdate=20200404
pkgrel=1
pkgdesc="Just a test script dealing with hockey games and stats."
arch=('any')
url="https://github.com/GameMaker2k/Neo-Hockey-Test/"
license=('BSD')
replaces=('python-hockeystats' 'python-pyhockeystats')
depends=('python')
options=(!strip !emptydirs)
_gitrevision='c791d4341c1f2216c52fe6b45c6db61c9d915862'
source=("https://github.com/GameMaker2k/Neo-Hockey-Test/archive/${pkgdate}.tar.gz")
md5sums=('da70c610f56bcfe932eb5960e8a78d7c')
sha224sums=('95a3b319cd1db67cb79870e2ae373a363b9da48a1f25d996d83ec0b6')
sha256sums=('1da1863d49b79b2710fa5c128a2c2de81a74b51c0ca55c98fe3cbb85b09b3dc4')
sha384sums=('decc94a8510f1a7cc387ab60907f58367155d5db9b2c15376515fd45f6e725b8982078cf8ee89735ae39f55e77087c65')
sha512sums=('91125cddd19e77935779149c0460893eaea69b6c874c369874b47216afbc655e1e560b201cc7a0b24e221d59f922073ef4678675b9669aaa24d12a4d1985fd60')
b2sums=('557fd1002fba13e198a18a23e49efff39c27d08586dfc7054391038c8be0840f8a390c5c92b06dee9167eb15b74ce0b5e65b4d0c9b2675ccc2169957edc37fce')

package() {
  cd "${srcdir}/Neo-Hockey-Test-${_gitrevision}"
  /usr/bin/python ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
