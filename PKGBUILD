# Maintainer: Yash Karandikar <nerdstep710@gmail.com>

pkgname=haur
pkgver=1.5
pkgrel=1
pkgdesc="Helper for the Arch User Repository"
arch=('any')
url="https://github.com/karx1/haur"
license=('LGPLv3')
depends=('bash' 'git')
source=("haur" "haur-clear-cache")
package () {
	install -Dm777 "$srcdir"/haur "$pkgdir"/usr/bin/haur
	install -Dm777 "$srcdir"/haur-clear-cache "$pkgdir"/usr/bin/haur-clear-cache
}
md5sums=('0335252e4131687c406cda719a355448'
         'cc3f9f8eaa5cdb1254bc7e71916b6a0a')
