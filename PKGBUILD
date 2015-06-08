# Maintainer:  Jameson Pugh <imntreal@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=python2-unity-singlet
pkgver=0.3
pkgrel=100
pkgdesc="Python library for building simple Unity lenses and scopes"
arch=('any')
url="https://launchpad.net/ubuntu/+source/unity-singlet"
license=('GPL')
groups=('unity-extra')
depends=('libunity' 'python2')
source=("https://launchpad.net/singlet/trunk/0.3.0/+download/unity-singlet_${pkgver}.tar.gz")
noextract=("unity-singlet_${pkgver}.tar.gz")
sha512sums=('9bd50940e0c43a4854d534587ef86b92ba39b0b517f0cc2928ed1021b9a7d38dec201efdd507ef08520a067b0efd5bf6fbdc2c3e77ac761c48d65d8d904f65de')

package() {
  mkdir "${srcdir}/unity-singlet-${pkgver}"
  cd "${srcdir}/unity-singlet-${pkgver}"
  tar zxvf "${srcdir}/unity-singlet_${pkgver}.tar.gz"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
