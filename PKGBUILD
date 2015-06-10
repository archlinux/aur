# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte*gmail>

pkgname='dtrx'
pkgver='7.1'
pkgrel='3'
pkgdesc='A intelligent archive extraction tool'
arch=('any')
url='http://brettcsmith.org/2007/dtrx/'
license=('GPL3')
depends=('python2')
optdepends=(
  'tar: to extract tar, deb, and gem archives'
  'unzip: to extract zip archives'
  'cpio: to extract cpio and rpm archives'
  'rpm2cpio: to extract rpm archives'
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

md5sums=('4be207724b75aea3e9f93374298b2174')
source=("$url$pkgname-$pkgver.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir"
}
