pkgname=checkra1n-cn
pkgver=0.12.1
pkgrel=1
pkgdesc="checkra1n是一款支持A7-A11设备的越狱软件"
license=('unknown')
conflicts=('checkra1n')
arch=('x86_64')
depends=('axel' 'sudo')
sha256sums_x86_64=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
source_x86_64=("http://jrcloud.gitee.io/jrcloud-checkra1n/install.sh")
package()
{
     sudo rm -rf /usr/bin/checkra1n
     sudo axel -o /usr/bin/checkra1n http://jrcloud.gitee.io/jrcloud-checkra1n/checkra1n
     sudo chmod +x /usr/bin/checkra1n
}
