# Maintainer: Mees Valkenburg <`echo bWVlc3J1ZGlnZXJhcmRAbGl2ZS5ubAo= | base64 -d`>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte*gmail>

pkgname='dtrx'
pkgver='7.1'
pkgrel='4'
commit='671ccf7d1b7ea90a6e6e6cc44234ef14874d59bf'
pkgdesc='An intelligent archive extraction tool'
arch=('any')
url='http://github.com/brettcs/dtrx'
license=('GPL3')
depends=('python2')
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

md5sums=('SKIP')
source=("git+http://github.com/brettcs/dtrx#commit=$commit")

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="$pkgdir"
}
