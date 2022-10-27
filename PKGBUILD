# Maintainer: Chance Chen <ufbycd@163.com>

pkgname=awstudio-community
pkgver=1.1.18
pkgrel=1
pkgdesc="The commercial grade solution of low-code application development base on AWTK."
arch=('x86_64')
url="https://awtk.zlg.cn"
license=('CUSTOM')
groups=('')
depends=('alsa-lib' 'desktop-file-utils' 'gcc' 'glu' 'gtk3' 'harfbuzz' 'hicolor-icon-theme' 'libgl' 'libibus' 'readline' 'scons' 'sndio' 'tracker3-docs' 'libgit2' 'openssl')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://zlgcloud.oss-cn-shenzhen.aliyuncs.com/awstudio/AWStudio-Community-amd64-${pkgver}.deb")
sha512sums=('68b4b68d2118a75a2894aa57ad71055ba3c6bcd099dd843ffbbf3287c47265f39fa25ba3178ae5a16c0115ae86af72ea208165f1efdd9b192016aa268875dcbd')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	#install -D -m644 "usr/share/AWStudio/resources/sign/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
