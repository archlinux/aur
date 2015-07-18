# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# Similar tools: tcp-cutter, tcpkill
# Recommended build command: makepkg -scCfi

set -u
pkgname='killcx'
pkgver='1.0.3'
pkgrel='1'
pkgdesc='a Perl script to close a TCP connection under Linux, whatever its state is'
arch=('any')
license=('GPLv3')
depends=('perl' 'perl-net-rawip' 'perl-net-pcap' 'perl-netpacket')
url='http://spamcleaner.org/en/misc/killcx.html'
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz")
sha256sums=('0d383ab743bbd02f877072f4ced0044f7746981460f25ec0da5df0a95825f111')

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 'LICENSE.TXT' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
  set +u
}

set +u
