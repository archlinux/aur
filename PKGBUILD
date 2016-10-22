# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname='preloader-signed'
pkgver='20130208'
pkgrel='1'
pkgdesc='Linux Foundation UEFI secure boot system'
url='http://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/'
arch=('any')
license=('GPL' 'LGPL2.1')
options=('!strip')
source=(http://blog.hansenpartnership.com/wp-uploads/2013/PreLoader.efi
        http://blog.hansenpartnership.com/wp-uploads/2013/HashTool.efi)

md5sums=('4f7a4f566781869d252a09dc84923a82'
         '45639d23aa5f2a394b03a65fc732acf2')

package() {
	install -D -m0644 "${srcdir}/PreLoader.efi" "${pkgdir}/usr/share/${pkgname}/PreLoader.efi"
	install -D -m0644 "${srcdir}/HashTool.efi" "${pkgdir}/usr/share/${pkgname}/HashTool.efi"
}
