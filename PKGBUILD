#Leanify was created by JayXon 
#https://github.com/JayXon
#
# aur package by: Juan Jaramillo <jmboris at gmail dot com>

pkgname=leanify
pkgver=0.4.2
pkgrel=1
pkgdesc="lightweight lossless file minifier/optimizer"
arch=('i686' 'x86_64')
url="https://github.com/JayXon/Leanify"
license=('MIT')
if [ ${CARCH} == 'x86_64' ]
then
source=(https://github.com/JayXon/Leanify/releases/download/v${pkgver}/leanify_linux64.tgz)
md5sums=('8e57cfb818d14b942e6fda4b5d224b31')
else
source=(https://github.com/JayXon/Leanify/releases/download/v${pkgver}/leanify_linux32.tgz)
md5sums=('826fffef7c07986e1a3c6427ea66938a')
fi 

package() {
 
  cd "$pkgdir"
    install -dm 755 "$pkgdir/usr/bin/"
    install -m755 "$srcdir/leanify" "$pkgdir/usr/bin/"

}
