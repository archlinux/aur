# Maintainer: Okashi <okashi@fourchin.net>
pkgname=owo-cli
pkgver=0.0.17
pkgrel=2
epoch=
pkgdesc="A bash based file uploader and URL shortener for owo.whats-th.is"
arch=('x86_64')
url="https://whats-th.is"
license=('MIT')
groups=()
depends=('curl' 'xclip' 'maim' 'slop' 'grep' 'libnotify')
changelog=
source=("https://github.com/whats-this/owo.sh/raw/master/dist_pkgs/owo-cli-0.0.17.tar.gz")
noextract=()
sha256sums=('b857cd11732bd04fb5a7d8d11a561d2de69dc2883a45a914d4b574383d4738d4')
validpgpkeys=('E7C0305DCEED5E9988AE9E5ADE754D221AD4051A') # Okashi

package() {
        tar zxf $pkgname-$pkgver.tar.gz
	cd "$pkgname-$pkgver"
        mkdir -p ~/.config/owo
        cp ./* ~/.config/owo/
        sudo ln -s ~/.config/owo/script.sh /usr/local/bin/owo
}
