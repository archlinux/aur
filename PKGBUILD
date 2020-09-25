# Maintainer: Trevor McKay <trs.mckay@gmail.com>
# Contributor: Trevor McKay <trs.mckay@gmail.com>
pkgname=fzf-open
pkgrel=1
pkgdesc="Use fzf to open files in appropriate applications (a la macOS Spotlight)"
arch=('any')
url="https://github.com/trmckay/fzf-open.git"
license=('GNU General Public License v3.0')
depends=(fzf bash)
makedepends=(git)
changelog=
sha256sums=('0cd770e85129a91d685b102ce34fed0b2ba51f3db6ef6c762da47984f507c61c')
pkgver=0.2
source=("https://github.com/trmckay/fzf-open/releases/download/v$pkgver/fzf-open-$pkgver.tar.gz")

package() {
    cd $srcdir
    sudo cp ./fzf-open.sh /usr/bin/fzf-open
    mkdir -p $HOME/.config/fzf-open
    cp lopen.sh $HOME/.config/fzf-open/lopen.sh
    cp example_config $HOME/.config/fzf-open/config
}
