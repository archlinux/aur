# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-lite
pkgver=3
pkgrel=6
pkgdesc='Pantheon Lite Session (replaces Gala with Openbox & Compton)'
arch=('i686' 'x86_64')
url='https://bbs.archlinux.org/viewtopic.php?pid=1402016#p1402016'
license=('GPL3')
groups=('pantheon-qq')
depends=('openbox' 'compton' 'pantheon-workarounds'
         'plank' 'cerbere' 'wingpanel-standalone-git')
optdepends=("obconf: openbox configuration utility"
            "elementary-os-openbox: Elementary theme for Openbox"
            "hsetroot: Set X11 background")
provides=("pantheon-lite")
conflicts=()
source=(pantheon-openbox.{desktop,session} 
        compton-{dbus.desktop,inverter} 
        obsession{,.desktop}
        openbox-qq-rc.xml)
sha512sums=('6cb25616a1fd238040f81eb8ed2c26f35fa9d9648c2b551df7e3bc2d56726d41d8bf08445b36cbb5b5f5412a4d2c06e09132d6cddcdba0d877d53a9fe97febab'
            '05bcc93aa3018c1031563f2754ebfb1c0f6b62d3694d024fe1e17d8c4fdaa196d3228e9befe72043869a0fbbb5e78d8ee5affee0ff3f26f78c4a8bc3d8670177'
            '0917b70b9811e8f4a61a5f962f9103c378385d58f2b5b62c770ed0d3f75874aa0678be468270c370248f5e24279208c38fabbff704da1ed9b67c07d8cb0becc2'
            '8696b95b4f6b37c9edddcdbef95300d0651d56b12cf1238204874aa625a37c84a30b324b08bdfbe67735785eea2c448e09ad3e2028c0f6058b02b7d4cf665e7c'
            '29003ab93d6ddded6503b8686764ef269bd3f93c14d92a9998c6504e2cde6bc6a71f4c8bedcb5ccb2b94cea776a7ba57e2ffa360b949b99c44dedd7d3e5ad254'
            'c70588c4d844c8916a97c61fae40dab2a38527fa0d31c7261700766f2e784d642edccb1a64544b9dfdc0655dd5a6b872e9bf323029091656ae45b0924d15ea0e'
            '581ebce75d6b7915d586ae0b34fd4ed4620c3f3dd0ab5d3e8516f03d286a09d0b66141193a8178845c853dbb86d986de906555598133210ba946e4dd54eba60e')

package() {
  install -Dm644 {,"${pkgdir}"/usr/share/xsessions/}pantheon-openbox.desktop
  install -Dm644 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-openbox.session
  install -Dm644 {,"${pkgdir}"/usr/share/applications/}compton-dbus.desktop
  install -Dm755 {,"${pkgdir}"/usr/bin/}compton-inverter
  install -Dm755 {,"${pkgdir}"/usr/bin/}obsession
  install -Dm644 {,"${pkgdir}"/usr/share/applications/}obsession.desktop
}

