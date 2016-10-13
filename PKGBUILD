# Maintainter: Joost Bremmer <toost.b@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: vae77 <fernandogrd@yahoo.com.br>

pkgname=neovim-indent-object
pkgver=1.1.2
pkgrel=1
pkgdesc='Text objects based on indent levels'
arch=(any)
url='http://www.vim.org/scripts/script.php?script_id=3037'
license=(MIT)
groups=('neovim-plugins')
depends=(neovim)
install=nvim-doc.install
source=("$pkgname-${pkgver}.tar.gz::https://github.com/michaeljsmith/${pkgname#neo}/tarball/$pkgver")
sha256sums=('8fa0e3f117d666c28fe4ab7128096c056fe1cc2c3347e2d5da95eff92d96ca78')

package() {
    cd "$srcdir/michaeljsmith-${pkgname#neo}-eb911bc/"
    local installpath="$pkgdir/usr/share/nvim/runtime"
    install -dv "$installpath"
    cp -r --no-preserve=owner * "$installpath"
}
