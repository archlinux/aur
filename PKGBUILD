pkgname=localist-bin
_version=1.21.3
pkgver=${_version//-/}
pkgrel=1
pkgdesc='A local project organizer for folders, repositories, and work in progress'
arch=('x86_64')
url='https://github.com/skorotkiewicz/localist'
# Upstream does not currently provide a license file.
license=('LicenseRef-Unknown')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=("localist=${pkgver}")
conflicts=('localist')
options=('!strip' '!debug')
source=("https://github.com/skorotkiewicz/localist/releases/download/v${_version}/localist_${_version}_amd64.deb")
sha256sums=('7895713a796ac8eb62c41e1e28612f5b360937daee3c1d96d2d95e2bfefba501')

package() {
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
