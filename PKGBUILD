pkgname=glitter-git
pkgver=master
pkgrel=1
pkgdesc='Git repositories management tool written in bash'
arch=('any')
url='https://gitlab.com/lordinvader/glitter'
depends=('bash')
source=('git+https://gitlab.com/lordinvader/glitter')
sha256sums=('SKIP')

package() {
	  mkdir -p $pkgdir/usr/bin
	  printf "#!/bin/bash\n\nconfdir=$HOME/.config/glitter\n" > $pkgdir/usr/bin/glitter
	  cat $srcdir/glitter/glitter.sh >> $pkgdir/usr/bin/glitter
	  chmod +x $pkgdir/usr/bin/glitter
}