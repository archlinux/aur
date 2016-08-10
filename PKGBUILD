# Maintainer: Rodrigo González López <rodrigosloop AT gmail DOT com>
# Maintainer: Zachary Michaels <mikezackles AT gmail DOT com>
#
#Current sha1 can be found here:
#https://chromium.googlesource.com/chromium/buildtools/+/master/linux64/gn.sha1

sha1='6d5e6af421f8e6cc11315f411439d889edc7cb4a'
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
sha512sums=('42a16589b7384578145eb3a5af4ea6e8ef7ccb2c778991d480fd9b2ae21432612c5ad9304605491f4bb91b3eca49622d2df16709552076af77b206d64f644db9')

package () {
  install -Dm755 "$srcdir/$sha1" "$pkgdir/usr/bin/gn"
}
