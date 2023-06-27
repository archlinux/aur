pkgname=matlab-documentation
pkgver=9.14
pkgrel=1
pkgdesc="MATLAB documentation"
arch=('any')
url="https://www.mathworks.com/help/releases/R2023a/install/ug/install-documentation-on-offline-machines.html"
license=('custom')
source=('local://R2023a_Doc_Linux.iso')
md5sums=('8e8018a3396d5af9e18aff6d1d1e6832')

package() {
    mkdir -p $pkgdir/opt/MATLAB/R2023a
    $srcdir/bin/glnxa64/mpm install-doc --matlabroot="/opt/MATLAB/R2023a" --destination="$pkgdir/opt/MATLAB/R2023a"
}
