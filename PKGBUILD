pkgbase=aibizhi
pkgname=aibizhi
pkgver=r1
pkgrel=1
pkgdesc="爱壁纸"
arch=('any')
license=('GPLv3')
depends=('python-pyside' 'python2-pyside')
makedepends=('git')
source=(git+https://gitcafe.com/LoveWallpaper/LoveWallpaperHD-Linux.git)
md5sums=('SKIP')
pkgver(){
cd "$srcdir/LoveWallpaperHD-Linux"

}
build() {
   msg "Starting build..."
   msg "第一次打包,做的不好还请见谅.(≧ω≦)"
   msg "                                   竹子酱"
 cd "$srcdir/LoveWallpaperHD-Linux"
chmod +x INSTALL.sh

}
package(){
cd "$srcdir/LoveWallpaperHD-Linux"
sudo ./INSTALL.sh
}
