pkgname=checkra1n-cn
pkgver=0.12.1
pkgrel=1
pkgdesc="checkra1n是一款支持A7-A11设备的越狱软件"
license=('unknown')
arch=('x86_64')
makedepends=('axel' 'sudo')
sha256sums_x86_64=('1e19768bb941383e3538fc89aedd991709f8deed6a78dd5f3f7b73c622d0313f')
source_x86_64=("http://jrcloud.gitee.io/jrcloud-checkra1n/install.sh")
package()
{
     sudo rm -rf /usr/bin/checkra1n
     sudo axel -o /usr/bin/checkra1n http://jrcloud.gitee.io/jrcloud-checkra1n/checkra1n
     sudo chmod +x /usr/bin/checkra1n
}
