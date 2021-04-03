# Maintainer: nodauf <nodauf at tutonato dot com>
pkgname=girsh-bin
pkgver=0.26.1
pkgrel=1
pkgdesc="Automatically spawn a reverse shell fully interactive for Linux or Windows victim"
arch=('x86_64')
url="https://github.com/nodauf/Girsh"
license=('GPL2')
depends=('glibc')

source_x86_64=("https://github.com/nodauf/Girsh/releases/download/v${pkgver}/Girsh-v${pkgver}-linux-amd64.tar.gz")

md5sums_x86_64=('73355fa71af9956edfe136196f017cb7')

package() {

    #untar the archive
	tar -xf ${srcdir}/Girsh-v${pkgver}-linux-amd64.tar.gz
    
    # install binary
    install -Dm 755 "${srcdir}/Girsh" "${pkgdir}/usr/bin/girsh"

}
