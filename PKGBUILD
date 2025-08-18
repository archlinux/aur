# Maintainer: Marcel Campello <marcel.campello@prafrentex.com.br>

pkgbase=kde-applications-meta-slim
pkgname=(kde-applications-meta-slim
         kde-accessibility-meta-slim
         kde-graphics-meta-slim
         kde-multimedia-meta-slim
         kde-network-meta-slim
         kde-pim-meta-slim
         kde-system-meta-slim
         kde-utilities-meta-slim)
pkgver=25.08
pkgrel=1
arch=(any)
license=(None)
url='https://apps.kde.org/'

package_kde-applications-meta-slim() {
  pkgdesc='Meta package for KDE Applications (slim selection)'
  depends=(kde-graphics-meta-slim
           kde-multimedia-meta-slim
           kde-network-meta-slim
           kde-system-meta-slim
           kde-utilities-meta-slim)
  optdepends=('kde-accessibility-meta-slim: Meta package for KDE accessibility applications (slim selection)'
              'kde-pim-meta-slim: Meta package for KDE PIM applications (slim selection')
}

package_kde-accessibility-meta-slim() {
  pkgdesc='Meta package for KDE accessibility applications (slim selection)'
  depends=(kmag
           kmousetool
           kmouth
           kontrast)
}

package_kde-graphics-meta-slim() {
  pkgdesc='Meta package for KDE graphics applications (slim selection)'
  depends=(colord-kde
           gwenview
           kcolorchooser
           kdegraphics-thumbnailers
           okular
           svgpart)
}

package_kde-multimedia-meta-slim() {
  pkgdesc='Meta package for KDE multimedia applications (slim selection)'
  depends=(dragon
           elisa
           ffmpegthumbs
           juk
           kdenlive)
}

package_kde-network-meta-slim() {
  pkgdesc='Meta package for KDE network applications (slim selection)'
  depends=(kdenetwork-filesharing
           kio-extras
           kio-gdrive
           kio-zeroconf
           ktorrent)
}

package_kde-pim-meta-slim() {
  pkgdesc='Meta package for KDE PIM applications (slim selection)'
  depends=(akonadi-calendar-tools
           akonadiconsole
           akregator
           grantlee-editor
           kaddressbook
           kalarm
           kdepim-addons
           kleopatra
           kmail
           kontact
           korganizer)
}

package_kde-system-meta-slim() {
  pkgdesc='Meta package for KDE system applications (slim selection)'
  depends=(dolphin
           dolphin-plugins
           kde-inotify-survey
           khelpcenter
           kio-admin
           kjournald
           ksystemlog)
}

package_kde-utilities-meta-slim() {
  pkgdesc='Meta package for KDE utilities applications (slim selection)'
  depends=(ark
           filelight
           kate
           kcalc
           kcharselect
           kdialog
           kgpg
           konsole
           kwalletmanager
           markdownpart
           skanpage
           yakuake)
}
