# Maintainer: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=fortune-mod-lambda
pkgver=11
pkgrel=1
pkgdesc="Collection of fortune cookies of lambda nature"
url="http://www.gotlisp.com/lambda/"
arch=("any")
license=("custom")
depends=("fortune-mod")
groups=("fortune-mods")
source=("http://www.gotlisp.com/lambda/lambda.dat"
        "http://www.gotlisp.com/lambda/lambda.txt")

md5sums=('0f2c915c3ef183024fceb37aead57449'
         'f423816a70c31117abf696cbd58cf2fe')

package() 
{
  mkdir -p $pkgdir/usr/share/fortune
  install -Dm644 lambda.dat $pkgdir/usr/share/fortune/lambda.dat
  install -Dm644 lambda.txt $pkgdir/usr/share/fortune/lambda
}
