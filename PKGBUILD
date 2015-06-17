#Contributor Pavol Hluchy (Lopo) <lopo@losys.eu>

pkgname=kdm-theme-branding-starboard
pkgver=1.0
pkgrel=1
pkgdesc='KDM4 Theme'
arch=(any)
url='http://opendesktop.org/content/show.php?content=149221'
license=('GPL')
md5sums=('631b94121ec2005e0128fbc0940a07e5')
source=('http://dl.dropbox.com/u/27352353/Branding-Starboard-Arch.tar.gz')

build()
{
	mkdir -p $pkgdir/usr/share/apps/kdm/themes
	rm $srcdir/Branding-Starboard-Arch/settings.xml\~
	mv $srcdir/Branding-Starboard-Arch $pkgdir/usr/share/apps/kdm/themes
}
