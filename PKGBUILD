# Maintainer: Trevor McKay <trs.mckay@gmail.com>
# Contributor: Trevor McKay <trs.mckay@gmail.com>
pkgname=fzf-open
pkgrel=1
pkgdesc="Use fzf to open files in appropriate applications (a la macOS Spotlight)"
arch=('any')
url="https://github.com/trmckay/fzf-open.git"
license=('GPL3')
depends=(fzf bash)
makedepends=(git)
changelog=
sha256sums=('85c53baf412dfc4ca0f8b2c9a9603585a5aa981638d63b91bb52773616f226f9')
pkgver=0.2.1
source=("https://github.com/trmckay/fzf-open/releases/download/v$pkgver/fzf-open-$pkgver.tar.gz")

package() {
    cd $srcdir
    install -Dm 755 fzf-open.sh ${pkgdir}/usr/bin/fzf-open
    install -d ${pkgdir}/usr/share/fzf-open/
    install -Dm 755 lopen.sh ${pkgdir}/usr/share/fzf-open
    install -Dm 644 example_config ${pkgdir}/usr/share/fzf-open/example_config
}
