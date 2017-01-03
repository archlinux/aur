# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sejda-desktop
pkgver=2.1.1
pkgrel=1
license=('unknown')
pkgdesc='PDF editor'
arch=("i686" "x86_64")
url='http://www.sejda.com/desktop'
source=("https://bitbucket.org/sejdapdf/sejda-desktop-public/downloads/sejda-desktop_${pkgver}_amd64.deb")
sha512sums=('b30a1719b40f7d4663d7e19214cbb53dfc78c87bc4303796c3f5c1188d16f0482e825a7745041cb98bd1f1b46d157a74f3fe8383547a6ec86dbb5371ba3ed3ef')
options=(!strip)

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/sejda-desktop/sejda-desktop "${pkgdir}/usr/bin/sejda-desktop"
}
