# Maintainer: AntiApple4life <antiapple at antiapple dot net>
# Contributor: Mees Valkenburg <`echo bWVlc3J1ZGlnZXJhcmRAbGl2ZS5ubAo= | base64 -d`>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte*gmail>

pkgname='dtrx'
pkgver='8.6.0'
pkgrel='1'
pkgdesc='An intelligent archive extraction tool'
arch=('any')
url='http://github.com/dtrx-py/dtrx'
license=('GPL3')
depends=('python3')
makedepends=('python-setuptools')
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
sha256sums=('94697941b640ffcd3c689895df8fb88e52ea98dec05dc181b9e996df761311a1')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
}
