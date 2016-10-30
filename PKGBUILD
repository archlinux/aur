# Maintainer of AUR package: Raansu <gero3977@gmail.com>
# Maintainer of splitviewfuse project: seiferma <https://github.com/seiferma>
pkgname=splitviewfuse
pkgver=0.3.1
pkgrel=1
pkgdesc="A view on a given directory that splits large files into segments implemented as FUSE file system. An additional filesystem that merges such segments into regular files is included as well. AUR package by Raansu, project by seiferma"
arch=('any')
url="https://github.com/seiferma/splitviewfuse"
license=('MIT')
depends=('fuse' 'python2-fusepy')
makedepends=('python2' 'python2-setuptools')
provides=('splitviewfuse' 'unionviewfuse')
conflicts=('splitviewfuse-git' 'splitviewfuse' 'unionviewfuse')
source=("https://github.com/seiferma/splitviewfuse/archive/v${pkgver}.tar.gz")
sha256sums=('f4f373cd005c3719414a010c5b80f8c15c923ec82ab4a9afc66498a311f62513')

package() {
   cd "${srcdir}/${pkgname}-${pkgver}" 
   python2 setup.py install --root="${pkgdir}/" --optimize=1
}
