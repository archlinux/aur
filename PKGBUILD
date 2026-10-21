pkgname=localist-bin
_version=1.21.5
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
sha256sums=('6f960141e7c36ec107489acf3cae5f72276b412c4360f32c458f8eeecf994dd5')

package() {
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
}
