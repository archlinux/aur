# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

_gonamespc='github.com/schollz/croc'
pkgname=croc-bin
pkgver=3.0.6
pkgrel=1
pkgdesc="Easily and securely send things from one computer to another."
arch=('x86_64')
url="https://${_gonamespc}"
license=('MIT')
#depends=()
#makedepends=('go')
provides=('croc')
conflicts=('croc' 'croc-git')
#options=()
source=("${url}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_64bit.tar.gz")
sha512sums=('7232fef40202538a6d488e5cd53e82fb296fabc8dc803bcc367bbe757aeaf0ff690269282260f8f7ad087b582777d736d6ce2c0dc3454cd6644f8b5b6bd8248a')

package() {
	install -Dm755 "${srcdir}/${provides[0]}" "${pkgdir}/usr/bin/${provides[0]}"
}
