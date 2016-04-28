# Maintainer: Youngbin Han <sukso96100@gmail.com>
pkgname=micro
pkgver=0.0
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=("micro-git")

if [[ $CARCH == 'x86_64' ]]; then
  source=(http://zbyedidia.webfactional.com/micro/binaries/micro-linux64.tar.gz)
else
  source=(http://zbyedidia.webfactional.com/micro/binaries/micro-linux32.tar.gz)
fi

md5sums=(SKIP)
package(){
 install -Dm755 $srcdir/$pkgname/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
