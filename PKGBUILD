# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2002
epoch=1
pkgver=0.919
pkgrel=1
pkgdesc="beta test font for Plane Two"
arch=('any')
url="https://www.code2001.com/"
license=('custom')
source=('http://www.code2001.com/CODE2002.ZIP')
md5sums=('0f776123a1dd54544f984a6c61e09ca1')
sha256sums=('421ba52665748023598ee1e873fb4f9c8bb7cd29ade333742c91c9aaef740f46')
sha512sums=('ea85f9f5faf580be117a5a4e7c7798b3d42ae6c338ef846d1ef8635251fbc6174d07bd29d2dc3ebb1ecd4a6aac3abd46adaaf9037fbacc0275ad1efef422e3f2')

package() {
  install -D -m644 CODE2002.TTF "$pkgdir/usr/share/fonts/TTF/Code2002.ttf"
}
