# Contributor Pavol Hluchy (Lopo) <lopo@losys.eu>

pkgname=kdm-theme-matrix-welcome
pkgver=1.0
pkgrel=1
pkgdesc='A nice KDM matrix theme'
arch=(any)
url='http://kde-look.org/content/show.php/matrix-welcome?content=159135'
license=('GPL')
sha512sums=('35db8914e73d2b4a0b7af782cc7989763845d687f65410475db9862f392c2d83211a6d18a5b836be9b785baa316b7e76d62dceea7fc3be66a05a6f7fef307517')
source=('http://fc02.deviantart.net/fs70/f/2013/165/f/e/matrixkdm_tar_by_rhklinux-d68yr02.gz')
options=(!strip)

build()
{
	mkdir -p ${pkgdir}/usr/share/apps/kdm/themes
	rm -f ${srcdir}/matrix/.directory
	mv "${srcdir}/matrix" ${pkgdir}/usr/share/apps/kdm/themes
}

