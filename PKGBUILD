# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: vae77 <fernandogrd@yahoo.com.br>

pkgname=vim-indent-object
pkgver=1.1.2
pkgrel=7
pkgdesc='Text objects based on indent levels'
arch=(any)
url='https://www.vim.org/scripts/script.php?script_id=3037'
license=(MIT)
groups=('vim-plugins')
depends=(vim)
source=("$pkgname-${pkgver}.tar.gz::https://github.com/michaeljsmith/vim-indent-object/tarball/$pkgver")
sha256sums=('8fa0e3f117d666c28fe4ab7128096c056fe1cc2c3347e2d5da95eff92d96ca78')

package() {
    cd "$srcdir/michaeljsmith-vim-indent-object-eb911bc/"
    local installpath="$pkgdir/usr/share/vim/vimfiles"
    mkdir -p "$installpath"
    cp -r * "$installpath"
}
