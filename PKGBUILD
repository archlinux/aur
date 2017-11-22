# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine
pkgver=2.8
pkgrel=1
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=http://openrefine.org
license=('BSD')
depends=('java-environment' 'bash')
options=('!strip')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/${pkgver}/${pkgname}-linux-${pkgver}.tar.gz")
sha512sums=('03f41aa0e83a5c7c8d080c38f0f621a654eb0057168e2f615cab42f63c5a75c57b444cb24bf3185ad20eb0359b877f9e9ce48d101057865eb2d5226de5b4b218')

package()
{
    install -d ${pkgdir}/opt/${pkgname}
    cp -a ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
    # License
    install -d ${pkgdir}/usr/share/licenses/${pkgname}/
    install ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}
