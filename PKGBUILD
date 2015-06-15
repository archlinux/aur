# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase=python-amoeba
pkgname=("python-amoeba" "python2-amoeba")
pkgver=1.2
pkgrel=1
pkgdesc="Amoeba fit routine based on the method of Nelder and Meads"
url="http://stitchpanorama.sourceforge.net/Python/amoeba.py"
arch=('any')
license=('GPL2')
makedepends=("python" "python2")
source=("http://stitchpanorama.sourceforge.net/Python/amoeba.py"
        "setup.py")
md5sums=('7e6a9ad95d8639ec3d1da7c6db0928fb'
         'c68322a7608767cc03012e62b3baa546')

package_python2-amoeba() {
    depends=('python2')

    ## determine python minor version
    #ver=$(python2 --version 2>&1 | cut -d" " -f2 | cut -d"." -f2)
    #mkdir -p "${pkgdir}/usr/lib/python2.${ver}/site-packages/amoeba"
    #touch "${pkgdir}/usr/lib/python2.${ver}/site-packages/amoeba/__init__.py"
    #install -m644 amoeba.py "${pkgdir}/usr/lib/python2.${ver}/site-packages/amoeba"

    ls
    python2 setup.py install --root="${pkgdir}/" --optimize=1

}

package_python-amoeba() {
    depends=('python')
    ls   
    python setup.py install --root="${pkgdir}/" --optimize=1
    ## determine python minor version
    #ver=$(python --version 2>&1 | cut -d" " -f2 | cut -d"." -f2)
    #mkdir -p "${pkgdir}/usr/lib/python3.${ver}/site-packages/amoeba"
    #touch "${pkgdir}/usr/lib/python3.${ver}/site-packages/amoeba/__init__.py"
    #install -m644 amoeba.py "${pkgdir}/usr/lib/python3.${ver}/site-packages/amoeba"
}
