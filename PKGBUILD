pkgname=localist-bin
_version=1.20.5
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
sha256sums=('13c9971b583652a6f67cc599e41f5928ce5d0c52eb8e4898fbc2f374b1e3737b')

package() {
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
