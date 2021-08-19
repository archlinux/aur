# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-lite
pkgver=7
pkgrel=1
pkgdesc='Pantheon Lite Session (Gala replaced with openbox & picom)'
arch=('any')
url='https://bbs.archlinux.org/viewtopic.php?pid=1402016#p1402016'
license=('GPL3')
groups=('pantheon-qq')
depends=('openbox' 'picom' 'pantheon-qq-common')
optdepends=("archlinux-xdg-menu: Generate an applications menu for Openbox"
            "obconf: openbox configuration utility"
            "elementary-os-openbox: Elementary theme for Openbox"
            "hsetroot: Set X11 background"
            "xorg-xwininfo: set mousewheel transparency scrolling like compiz with picom-trans"
            "dbus: set window color inversion with picom-inverter")
source=(pantheon-openbox.{desktop,session} 
        picom-{dbus.desktop,inverter}
        openbox-session.desktop)
sha512sums=('1f950c641343e766cdd5b222dcac8f596e197fd5a9e3659a2bfce9da7020cf8575b0a64b9b7a0d810054303f03bb65f095222297682a5419eb6581517eb36e81'
            'b1c2da397d82bb71f2b96ea949c8b7cb6623ebc516fdcca7ac2aa98a9b295ab133aa27f36a6a1ed5c4294c2df9081cb81b9e336ca0ce000ef73343399144001f'
            'bff6d45fc78471ed9312d7be6381b541fa9a93adedef58f6ce7e09c2740e07c2a3fcf076dcaf25dd480a9164764933ba7850c7332e173acac161f36597d2786d'
            '59af86dcac812cb21a1b1211c763491b8907ac66693a5a827c10d9bbb7d828844ef276b44848753db93e170ec496096d621ff3d719d37fba1d701eabd0ebd676'
            '79d4c9f13fde13e31dbacd9f93de66278f35932367e32493d39cb99475ae638f706701e743f3796df4ac36913c91424170fb2053bd55036af0a23764d234b22b')

package() {
  install -Dm644 {,"${pkgdir}"/usr/share/xsessions/}pantheon-openbox.desktop
  install -Dm644 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-openbox.session
  install -Dm644 {,"${pkgdir}"/usr/share/applications/}picom-dbus.desktop
  install -Dm755 {,"${pkgdir}"/usr/bin/}picom-inverter
  install -Dm644 {,"${pkgdir}"/usr/share/applications/}openbox-session.desktop
}
