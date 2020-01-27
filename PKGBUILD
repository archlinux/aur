# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python-pyhockeystats
pkgver=0.0.8
pkgdate=20190217
pkgrel=1
pkgdesc="Just a test script dealing with hockey games and stats."
arch=('any')
url="https://github.com/GameMaker2k/Neo-Hockey-Test/"
license=('BSD')
replaces=('python-hockeystats' 'python-pyhockeystats')
depends=('python')
options=(!strip !emptydirs)
_gitrevision='cf3415f4098432c9d1cb66d1cf7e209664e0141b'
source=("https://github.com/GameMaker2k/Neo-Hockey-Test/archive/${pkgdate}.tar.gz")
md5sums=('b85edcab63f0fa765d7f6f51bb6422e5')
sha224sums=('58d8882d7af9f4307566614834602d7a435e5d5524e1a1e859d9b060')
sha256sums=('f91d360fde66fbef8d36f5a6ba7b38ab451f32bb1e72d0953a77945cba7cd44c')
sha384sums=('d8d3977f24361efe5b1489b21f1b41a8d02c41e11565149e2f4f332c5ff23ac84e0749c260586dd780c023c151bc00d5')
sha512sums=('7515c4f5f7b5f5cf71504269d8ee05a532d2ebeec211f61125e944674bb0df53c0a222a4853a9cdd7f5a31e61791bd5df68ab364686be7c6ae9f20c960be0dd0')
b2sums=('f952877ea5619836ab11de571deeb367c212e7432d046ec172dc84dce48d143132cf6b1c2163eb7fb6bf43fcb550550ca973da12c07faa5fc47713131a3c1a4d')

package() {
  cd "${srcdir}/Neo-Hockey-Test-${_gitrevision}"
  /usr/bin/python ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
