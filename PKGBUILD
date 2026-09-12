# Maintainer: Dax <mail@thdxr.com>
pkgname=opencode-beta
pkgver=0.0.0.beta.19507
pkgrel=1
pkgdesc='OpenCode beta - the AI coding agent for the terminal'
url='https://github.com/anomalyco/opencode'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'gcc-libs' 'ripgrep')
provides=('opencode' 'opencode2')
conflicts=('opencode' 'opencode2')
options=('!strip' '!debug')
source=('LICENSE' 'opencode2')
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b' 'cd03022601e4848a957999a2a7b1c1ccf18b94f9a084a44719f62abaacebe83c')
source_x86_64=('opencode-beta-0.0.0.beta.19507-x86_64.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64-baseline/-/cli-linux-x64-baseline-0.0.0-beta-19507.tgz')
sha256sums_x86_64=('4a98e34fe7b45000f0ea402e9971ee8b8159b07516f824f9744ae9f2333dafcb')
source_aarch64=('opencode-beta-0.0.0.beta.19507-aarch64.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-0.0.0-beta-19507.tgz')
sha256sums_aarch64=('5fccaa610f8fe3b02e06b2575b0682c39a2da2c209cfc65446a86c16cb685631')

package() {
  install -Dm755 "$srcdir/package/bin/opencode" "$pkgdir/usr/bin/opencode"
  install -Dm755 "$srcdir/opencode2" "$pkgdir/usr/bin/opencode2"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
