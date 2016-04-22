# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=xubuntu-community-artwork
pkgver=16.04.0
pkgrel=5
pkgdesc="Community wallpapers from Xubuntu 14.04 & 16.04"
arch=(any)
url="http://xubuntu.org/news/xubuntu-16-04-wallpaper-competition-winners/"
license=('custom')
provides=('xubuntu-community-wallpapers')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/x/"$pkgname"/"$pkgname"_"$pkgver".tar.xz" 
'xubuntu-community-wallpapers.xml' 'LICENSE')
sha512sums=('cca20d1e317168a00bbae5e3aadcf73db8c0f12504701aa36be2d53de7b9cef7919cbba07c53a08685845c4986ee88b2f3ba62ebde8cabf657626d36b5e6318c'
            '05c24292941c42086007aa1c8b77f8b3293c3956ee1ae04498f54f5b96a9b987ed7443aa3c9ade9c834e9074ae82822da18ad667a329f581bfcf4850bdc93fc9'
            '1357f5461c3a8a13d7f55ce8744770c69e681062319b535b4aec813caa2911c675ce59e77f9ad2810dd58c4e7f9898a8607d4f9f7b4133e9f0de5c4e5dd1673b')

package() {
  mkdir -p "$pkgdir"/usr/share/xfce4/backdrops/ "$pkgdir"/usr/share/gnome-background-properties/ "$pkgdir"/usr/share/licenses/"$pkgname"/
  cd "$srcdir"/$pkgname-$pkgver/usr/share/xfce4/backdrops/
  cp *.jpg "$pkgdir"/usr/share/xfce4/backdrops/
  cp "$srcdir"/xubuntu-community-wallpapers.xml "$pkgdir"/usr/share/gnome-background-properties/ 
  cp "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/
}
