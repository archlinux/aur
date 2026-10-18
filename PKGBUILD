pkgname=localist-bin
_version=1.21.4
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
sha256sums=('a5cd35508781b8a06403212ab16f8c242001fd6103d001b5dfedcdfc292c0e78')

package() {
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
