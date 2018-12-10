# Maintainer: Mark Wells <mwellsa at gmail dot com>

pkgname=fv
pkgver=5.5
pkgrel=1
pkgdesc="Fv is an easy to use graphical program for viewing and editing any FITS format image or table."
arch=('x86_64')
url="https://heasarc.gsfc.nasa.gov/docs/software/ftools/fv/fv_download.html"
source=("http://heasarc.gsfc.nasa.gov/FTP/software/lheasoft/fv/fv5.5_Linux.tar.gz")
sha256sums=('756bf7927d055b6ae680ef908a448c9cb181347c17e3f0a2b9153baf17d058d6')

package() {
        mkdir -p ${pkgdir}/opt/fv
        mkdir -p ${pkgdir}/etc/profile.d
        cp -r ${srcdir}/fv${pkgver}/* ${pkgdir}/opt/fv/
        echo 'export PATH="$PATH":/opt/fv' > ${pkgdir}/etc/profile.d/fv.sh
        source ${pkgdir}/etc/profile.d/fv.sh
}
