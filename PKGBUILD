# Maintainer: Your Name <1289747698@qq.com>

pkgname=ydict
pkgver=0.3.2
pkgrel=1
pkgdesc="dictionary/translation tool developed in Rust+Qt"
arch=('x86_64')
url="https://github.com/DreamSaddle/youdao-dict"
license=('GPL3')
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://files.cnblogs.com/files/dream-saddle/YDict-$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')

prepare() {
	echo ""
}

build() {
	echo "此软件通过打包好的二进制文件安装, 无需编译."
}

package() {
	cd "YDict-$pkgver/scripts"
	chmod +x install.sh
	./install.sh
}
