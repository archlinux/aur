# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Mees Valkenburg <`echo bWVlc3J1ZGlnZXJhcmRAbGl2ZS5ubAo= | base64 -d`>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte*gmail>

pkgname='dtrx'
pkgver='8.4.0'
pkgrel='1'
pkgdesc='An intelligent archive extraction tool'
arch=('any')
url='http://github.com/dtrx-py/dtrx'
license=('GPL3')
depends=('python3')
makedepends('python-setuptools')
optdepends=(
  'tar: to extract tar, deb, and gem archives'
  'unzip: to extract zip archives'
  'cpio: to extract cpio and rpm archives'
  'rpm-org: to extract rpm archives'
  'binutils: to extract deb archives'
  'gzip: deb, gem, gzip, and compress archives'
  'bzip2: to extract deb and bzip2 archives'
  'xz: to extract xz archives'
  'p7zip: to extract 7z archives'
  'unrar: to extract rar archives'
  'cabextract: to extract MS Cabinet archives'
  'unshield: to extract InstallShield archives'
  'lha: to extract lzh archives'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e96b87194481a54807763b33fc764d4de5fe0e4df6ee51147f72c0ccb3bed6fa')

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir"
}
