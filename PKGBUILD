# Maintainer: Sakura1943 <1436700265@qq.com>
pkgname=hexo-deployer-bin
pkgver=1.3
pkgrel=1
pkgdesc="Hexo deployment tool with typography theme"
arch=(x86_64)
url="https://gitlab.com/Sakura1943/hexo-deployer-with-theme-typography"
license=('GPL')
depends=('vim' 'nano' 'git' 'wget' 'curl' 'tar' 'gzip' 'zip' 'nodejs-lts-erbium' 'dialog')
provides=(hexo-deployer-bin=$pkgver)
replaces=()
backup=()
options=()
install=hexo-deployer-bin.install
changelog=
source=('hexo-deployer-bin.tar.gz')
noextract=()
md5sums=('70cf5773362f744873f62ebad4d201ff')
validpgpkeys=()

package() {
           install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
