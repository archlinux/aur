#Leanify was created by JayXon 
#https://github.com/JayXon
#
# aur package by: Juan Jaramillo <jmboris at gmail dot com>

pkgname=leanify
pkgver=0.4.3
pkgrel=1
pkgdesc="lightweight lossless file minifier/optimizer"
arch=('i686' 'x86_64')
url="https://github.com/JayXon/Leanify"
license=('MIT')
if [ ${CARCH} == 'x86_64' ]
then
source=(https://github.com/JayXon/Leanify/releases/download/v${pkgver}/leanify_linux64.tgz)
md5sums=('c74577329e48b46ba4c1c5d709252463')
else
source=(https://github.com/JayXon/Leanify/releases/download/v${pkgver}/leanify_linux32.tgz)
md5sums=('4d62118e91d5e4bb5f0ffec5b9ad1dc1')
fi 

package() {
 
  cd "$pkgdir"
    install -dm 755 "$pkgdir/usr/bin/"
    install -m755 "$srcdir/leanify" "$pkgdir/usr/bin/"

}
