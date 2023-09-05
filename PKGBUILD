pkgname=webfinit
pkgver=1.0
pkgdesc="A simple package that helps you to create a frontend project scoff"
url="https://github.com/mohammadrostamiorg/webFinit"
arch=('any')
license=('MIT')
maintainer="Mohammad Rosstami <mohammad.jayant@gmail.com>"
source=("webFinit.sh" "vanila.txt" "tailwind.txt" 'bootstrap.txt')
depends=('bash' 'coreutils' 'tree')
pkgrel=1
md5sums=('SKIP')
package() {
  install -Dm755 webFinit.sh "${pkgdir}/usr/bin/webFinit";
   install -Dm644 vanila.txt "${pkgdir}/usr/share/${pkgname}/vanila.txt"
  install -Dm644 bootstrap.txt "${pkgdir}/usr/share/${pkgname}/bootstrap.txt"
  install -Dm644 tailwind.txt "${pkgdir}/usr/share/${pkgname}/tailwind.txt"
}


