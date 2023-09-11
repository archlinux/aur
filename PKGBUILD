# Maintainer: Your Name <arehmanimran4@gmail.com>
pkgname=localnas
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A simple & small Nas web server for local wi-fi network."
arch=('x86_64')
url="https://github.com/abdurehman4/LocalNas"
license=('GPL')
groups=()
depends=('nodejs' 'yarn')
options=()

# prepare() {
# 	# curl -L 'https://github.com/abdurehman4/LocalNas/releases/download/v0.1.0/LocalNas-aur.tar.zst' > "${srcdir}/LocalNAS.tar.zst"
# 	# bsdtar -xf "${srcdir}/LocalNAS.tar.zst"
# }

package() {
	cd './LocalNas-aur/'
	mkdir -p "${pkgdir}/usr/share/localnas"
	mkdir -p "${pkgdir}/usr/bin"
	cp -r 'backend' "${pkgdir}/usr/share/localnas/"
	cp -r 'localnas' "${pkgdir}/usr/share/localnas/"
	cp -r 'localnas-run' "${pkgdir}/usr/bin/localnas"
}
