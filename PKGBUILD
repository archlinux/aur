#Current sha1 can be found here:
#https://chromium.googlesource.com/chromium/buildtools/+/master/linux64/gn.sha1
sha1='f7f6efdd260d826558919d1a7433dff099c58091'
pkgname='gn-bin'
pkgdesc="Prebuilt binary for GN (Generate Ninja), Chromium's meta-build system"
pkgver=r396969
pkgrel=1
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/src/tools/gn/'
source=(
  "https://storage.googleapis.com/chromium-gn/$sha1"
)
noextract=("$sha1")
sha512sums=('08161ed578c50f8ec5c030c4b92aa5693b669ef1df27252089eea5bb2730856845a3ef70ae8f957ac8cb414eef31117fd23e7cb615f8740d8588ad768e0df94c')

package () {
  install -Dm755 "$srcdir/$sha1" "$pkgdir/usr/bin/gn"
}
