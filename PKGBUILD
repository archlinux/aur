# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=xubuntu-community-artwork
pkgver=14.04.0
pkgrel=4
pkgdesc="Community wallpapers included with Xubuntu 14.04, 14.10 and 15.04"
arch=(any)
url="http://xubuntu.org/news/community-wallpaper-contest-winners"
license=('CC-BY-SA')
provides=('xubuntu-community-wallpapers')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/x/"$pkgname"/"$pkgname"_"$pkgver".tar.gz" 'xubuntu-community-wallpapers.xml')
sha512sums=('02fb511a090dd38adc28c6c79b10045f94a05ea948c4a0974a3ca209c8586c61e69f1b04d36426d00f9c14661a0fb9ed56b660f01f1e40fac321d98df86af482'
            'a19e33ef92f18144f575e9165b2fa4a44c1f52ecc8f8d28324d43c9d3e176d3d11935194dbffaa496bc5a874e56e90cf3ef5fa9cbe226c17ec93eaf7399669d5')

package() {
  mkdir -p "$pkgdir"/usr/share/xfce4/backdrops/ "$pkgdir"/usr/share/gnome-background-properties/
  cd "$srcdir"/$pkgname-$pkgver/usr/share/xfce4/backdrops/
  cp *.jpg "$pkgdir"/usr/share/xfce4/backdrops/
  cp "$srcdir"/xubuntu-community-wallpapers.xml "$pkgdir"/usr/share/gnome-background-properties/ 
}
