# Contributor Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname=kdm-theme-archlinux-dark
pkgver=0.4
pkgrel=1
pkgdesc='An Arch-Linux themed KDM greeter with user list selection box (Optimised for 1920x1200 displays, designed to seamlessly blend into the OxyArch Splash screen)'
arch=(any)
url='http://kde-look.org/content/show.php/Arch+Linux+Dark?content=156549'
license=('CC-BY-SA')
sha512sums=('d7cb3dbee0de66a979578d21b4433bcdec5eed8556d6576b4fc875ce69677cc540527e33c6d233efdfc13fc71fceb75450dd92f860d1e2cd8cc4306b8ade00b5')
source=('http://kde-look.org/CONTENT/content-files/156549-archlinux-dark.tar.gz')
options=(!strip)

build()
{
	mkdir -p ${pkgdir}/usr/share/apps/kdm/themes
	rm -f ${srcdir}/archlinux-dark/TRADEMARKS
	mv "${srcdir}/archlinux-dark" ${pkgdir}/usr/share/apps/kdm/themes
}
