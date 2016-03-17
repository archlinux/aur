# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: John K. Luebs <jkl@johnluebs com>
# Contributor: Simon Gomizelj <https://github.com/vodik>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Douglas Meyer <Douglas.Meyer@mail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact>
# Contributor: Alexander <iam.asm89@gmail.com>

pkgname=hipchat4
pkgver=4.0.1631
pkgrel=1
pkgdesc='Persistent group chat using XMPP (4.x edition - only 64-bit available)'
arch=(x86_64)
url='https://www.hipchat.com/linux'
license=(unknown)
depends=(alsa-lib fontconfig libgl libsm libxcomposite libxcursor libxkbcommon
         libxrandr libxslt libxss libxtst nss xcb-util-keysyms hicolor-icon-theme)
options=(!strip)
install='hipchat.install'
source=("https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/pool/HipChat4-${pkgver}-Linux.deb")
md5sums=(ab8f64008a00f48d786276f0ce3a66c8)

package() {
  cd "${srcdir}"
  tar xzf data.tar.gz
  cp -R "${srcdir}"/{opt,usr} "${pkgdir}"
}
