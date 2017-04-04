# Maintainer: Rodrigo González López <rodrigosloop AT gmail DOT com>
# Maintainer: Zachary Michaels <mikezackles AT gmail DOT com>
#
#Current sha1 can be found here:
#https://chromium.googlesource.com/chromium/buildtools/+/master/linux64/gn.sha1

sha1='a452edf26a551fef8a884496d143b7e56cbe2ad9'
pkgname='gn-bin'
pkgdesc="Prebuilt binary for GN (Generate Ninja), Chromium's meta-build system"
pkgver=r410137
pkgrel=1
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/src/tools/gn/'
source=(
  "https://storage.googleapis.com/chromium-gn/$sha1"
)
noextract=("$sha1")
sha512sums=('483d1b8c8ab30f0f94b330a6f71b1fad0293f3522cc49d039cafa2e4c1da02758e1cd440f768cd395025baf4f3c79f5ac4780827068315dc44fb4da2e0e2fc36')

package () {
  install -Dm755 "$srcdir/$sha1" "$pkgdir/usr/bin/gn"
}
