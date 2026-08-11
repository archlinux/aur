_repoowner="vinceliuice"
_reponame="MacTahoe-gtk-theme"
pkgname="mactahoe-gtk-theme"
pkgdesc="MacOS Tahoe theme for gtk desktops"
license=("MIT")
pkgver="2026.08.08"
pkgrel=1
arch=("any")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_repoowner/$_reponame/archive/refs/tags/${pkgver//./-}.tar.gz")
sha512sums=("100eadd397f49933215310d1ed8f70dc41a7956319ceba561c13de30567abdab7d8f247e830f8a0032947a111c570ef36c4b8568308dd6f35395a806882b1118")
url="https://github.com/$_repoowner/$_reponame"
options=("!debug")

package() {
    cd "$_reponame-${pkgver//./-}"

    _destination="$pkgdir/usr/share/themes/"
    mkdir -p "$_destination"
    ./install.sh -HD -o solid -d "$_destination"
}
