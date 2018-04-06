# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: cdfk <cdfk1981-at-gmail.com>

set -u
pkgname='brother-lpr-drivers-laser'
pkgver='2.0.1_3_0ubuntu5'
pkgrel='1'
pkgdesc='LPR drivers for DCP-7010 DCP-7020 DCP-7025 DCP-8060 DCP-8065DN FAX-2820 FAX-2920 HL-2030 HL-2040 HL-2070N HL-5240 HL-5250DN HL-5270DN HL-5280DW MFC-7220 MFC-7225N MFC-7420 MFC-7820N MFC-8460N MFC-8660DN MFC-8860DN MFC-8870DW'
arch=('i686' 'x86_64')
url='http://solutions.brother.com/linux/en_us/index.html'
license=('GPL' 'custom:brother commercial license')
depends=('brother-lpr-drivers-common' 'a2ps')
depends_x86_64=('lib32-glibc')
source_i686=("http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver//_/-}_i386.deb")
source_x86_64=("http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums_i686=('cf0120479d74d3be6796ae4d804e7b0d')
md5sums_x86_64=('ac86b51f47a344a1961ff13ff3cfe775')
sha256sums_i686=('fba405edd53dedffed9beb604d9f301f0b241630badaa9f340387866563d2713')
sha256sums_x86_64=('bd35371d79dd9ea02e8563be7b429f43acf9fc8d7bf01a187d8413eb16cfa221')

package() {
  set -u
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/data.tar".?z
  set +u
}
set +u
