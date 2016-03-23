# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=msjnc
pkgver=2.5
pkgrel=2
pkgdesc="MadScientist's JNC Session Manager"
arch=('any')
url='https://github.com/madscientist/msjnc'
license=()
depends=('gtk2-perl'
         'glib-perl'
         'unzip'
	 'lib32-zlib'
	 'net-tools'
	 'glib-perl'
	 'perl-libwww')
source=('https://github.com/madscientist/msjnc/archive/v2.5.tar.gz')
sha1sums=('079c066a91332b9a01cf0b687742817d1b53868a')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/${pkgname}-${pkgver}/msjnc" "${pkgdir}/usr/bin/"
}
