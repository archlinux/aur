# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-vaultier
pkgver=0.7.5
pkgrel=2
pkgdesc="Password manager/vault designed for sharing amongst a team"
arch=('i686' 'x86_64')
url="https://www.vaultier.org/"
license=('custom')
depends=('python' 'postgresql' 'supervisor')
optdepends=('nginx: for web interface' 'apache: for web interface' 'uwsgi: for web interface')
#makedepends=('')
_pkgname=vaultier
_pkgname2=Vaultier
provides=("python-vaultier")
#conflicts=("python-vaultier")
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/v/${_pkgname}/${_pkgname2}-${pkgver}.tar.gz"
        "Vaultier-0.7.5.tar.gz.sig")
sha512sums=('4e8acb9394f6c13b91a5ff63ff8688a10585ec6bf81318bdea260233cde5dc383e4589e3074c23100106b248017e9411da8e03530d2d7ce9ce72e5eee3f43627'
            'SKIP')
package() {
  cd "${srcdir}/${_pkgname2}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}
