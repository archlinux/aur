# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.4.8
pkgrel=1
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64')
url='https://www.brow.sh'
license=('LGPL2.1')
depends=('firefox>=57')
provides=('browsh')
conflicts=('browsh' 'browsh-git')
options=('!strip')
source=("https://github.com/browsh-org/browsh/releases/download/v${pkgver}/browsh_${pkgver}_linux_amd64")
sha512sums=('ca58a9386c46f0a182d7170565c09a3f1bbba25d51aff8408bd73721f886247fe388d446909cefa8abf7c9f13dd0be63f7e925d6c7b68f8a950ff229ac5a67f3')

package() {
	install -Dm755 browsh_${pkgver}_linux_amd64 $pkgdir/usr/bin/browsh
}
