# Maintainer: amtoaer <amtoaer@outlook.com>
pkgname=niutrans-cli
pkgver=1.4
pkgrel=1
pkgdesc="niutrans command line interface."
arch=('x86_64')
depends=('jre')
url="https://github.com/amtoaer/Niutrans-Cli"
license=('MIT')

source=("https://github.com/amtoaer/NiuTrans-Cli/releases/download/v$pkgver/NiuTrans-Cli-$pkgver.jar")

md5sums=('5b193254014a04271bffd57889c4fecd')

package(){
	echo '#!/usr/bin/java -jar' > niu
	cat $srcdir/NiuTrans-Cli-$pkgver.jar >> niu
	install -D -m 755 $srcdir/niu $pkgdir/usr/bin/niu
}
