# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname='preloader-signed'
pkgver='20130208'
pkgrel='1'
pkgdesc='Linux Foundation UEFI secure boot system'
url='https://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/'
arch=('x86_64')
license=('GPL' 'LGPL2.1')
options=('!strip')
source_x86_64=('https://blog.hansenpartnership.com/wp-uploads/2013/PreLoader.efi'
               'https://blog.hansenpartnership.com/wp-uploads/2013/HashTool.efi')

sha512sums_x86_64=('c73583439ad989f5eb3a68753df56a06dc2f04b637415e3c515c74654651e0991a1d5f0ab84da4cd1d681d29a35271ff584a5b988b28ce1b810f94c0d0a57aff'
                   'a51ce176c93417e53ec6d78c16afa5e8b9545e623d98d4fc55fc3762f33cd942ea1dce1211b2ed80703df08fe4fed84aff1fa86063c27b08413b3882019c4afd')

package() {
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/PreLoader.efi"
	install -D -m0644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/HashTool.efi"
}
