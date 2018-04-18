# Maintainer: Jan-Tarek Butt <tarek@ring0.de>
pkgbase=bootstrap-studio
pkgname=bootstrap-studio
pkgver=4.1.6
pkgrel=1
pkgdesc="Bootstrap Studio is a an app for creating beautiful websites."
provides=('bootstrapstudio')
url="https://bootstrapstudio.io/"
arch=('x86_64')
source+=("https://bootstrapstudio.io/releases/desktop/4/Bootstrap%20Studio%204%20(64bit).deb")
sha1sums+=('a76b8f3bebcbdb5abf75e7709f43faf0a6f8f728')

install=bootstrap-studio.install

build()
{
	cd "${srcdir}"

	# unpack
	tar --xz -xf data.tar.xz
}

package()
{
	cp -r "${srcdir}"/opt "${pkgdir}"/opt
        cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
