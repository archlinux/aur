# Author: Mark <nextgamer3152@gmail.com>
pkgname=catbox-bash
pkgver=2.0
pkgrel=1
pkgdesc="An implementation of CatBox.moe API in Bash"
arch=(any)
url="https://gist.github.com/MineBartekSA/1d42d6973ddafb82793fd49b4fb06591"
license=('MIT')
depends=('bash' 'curl')
optdepends=('xclip: for copying the upload url automatically')
provides=('catbox')
source=("catbox::https://gist.githubusercontent.com/MineBartekSA/1d42d6973ddafb82793fd49b4fb06591/raw/66073b9dc40a7c9e65ba470615071cf8f9f37809/catbox"
	"Makefile::https://raw.githubusercontent.com/alsoGAMER/catbox-bash/master/Makefile")
sha256sums=("1a7306f9c03055eace54a05505b12a0af2334d4ccb61e8ef81f1b11f5fe1e858" "SKIP")

package() {
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
