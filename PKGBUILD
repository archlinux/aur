# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=5.3.0.0
pkgrel=4
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_8b4b824586db4353bbfebe795f&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat' 'python' 'python-urllib3'
         'python-pyaes' 'python-colorama' 'python-jsonpointer'
         'python-six' 'python-ply' 'python-decorator'
         'python-jsonpatch' 'python-jsonpath-rw' 'python-setproctitle'
         'python-jsondiff' 'python-tabulate' 'python-prompt_toolkit'
         'python-certifi' 'python-wcwidth' 'python-future')
makedepends=("python-pip" "python-ilorest-library")
conflicts=('ilorest-bin')
provides=('ilorest')
groups=(hpproliant)
license=("HPE")
#source=("https://github.com/HewlettPackard/python-redfish-utility/archive/refs/tags/v$pkgver.tar.gz")
source=("https://github.com/HewlettPackard/python-redfish-utility/archive/refs/heads/master.zip")
sha256sums=('91bf155495c379dfd307cc03cbd5acbd99c54eb8ebb104e32aa305ad85ed5766')
changelog=ChangeLog

package() {
#    cd "$srcdir/python-redfish-utility-$pkgver"
    cd "$srcdir/python-redfish-utility-master"
    python setup.py install --root="$pkgdir/" --optimize=1
}
