pkgname=checkra1n-cn
pkgver=0.12.1
pkgrel=1
pkgdesc=""
license=('unknown')
conflicts=('checkra1n')
arch=('x86_64')
depends=('axel' 'sudo')
sha256sums_x86_64=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
source_x86_64=("http://jrcloud.gitee.io/jrcloud-checkra1n/install.sh")
package()
{
     sudo axel /usr/bin/checkra1n http://jrcloud.gitee.io/jrcloud-checkra1n/checkra1n
     sudo chmod +x /usr/bin/checkra1n
}
