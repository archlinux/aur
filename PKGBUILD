# Maintainer: Sakura1943 <1436700265@qq.com>
pkgname=hexo-deployer-with-theme-typography-bin
pkgver=1.3
pkgrel=1
pkgdesc="Hexo deployment tool with typography theme"
arch=(x86_64)
url="https://gitlab.com/Sakura1943/hexo-deployer-with-theme-typography"
license=('GPL')
depends=('vim' 'nano' 'git' 'wget' 'curl' 'tar' 'gzip' 'zip' 'nodejs-lts-erbium' 'dialog')
provides=(hexo-deployer-with-theme-typography-bin=$pkgver)
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname.tar.gz" "warning.sh")
noextract=()
md5sums=("SKIP" "SKIP")
validpgpkeys=()

package() {
           install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
           echo  'Please enter hexo-deployer-with-theme-typography-bin to run the script'
	   sh warning.sh
}
