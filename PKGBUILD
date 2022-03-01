# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=jbr-linux-x64
_pkgver=2022-02-01_08-58
pkgver=20220201
pkgrel=1
pkgdesc="A patched JetBrainsRuntime which fix fcitx5 cursor bug"
arch=('x86_64')
url='https://github.com/RikudouPatrickstar/JetBrainsRuntime-for-Linux-x64'
options=('!strip')
license=('custom')
source=(
  "https://github.com/RikudouPatrickstar/JetBrainsRuntime-for-Linux-x64/releases/download/${_pkgver}/${pkgname}-${_pkgver}.zip"
  'jbr-linux-x64.install'
)
sha256sums=(
  '7e35c51218e11c2bfe06c0553a680680950139928dea4e70ecfad8d47ccd51c0'
  '6764b372940b76bb6a030c392d8ae53a468c1f70855ce207073f786586243bd6'
)
install=jbr-linux-x64.install

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/jbr" "${pkgdir}/opt/jbr-linux-x64"
}

