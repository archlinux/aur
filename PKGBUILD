# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-user-agent-switcher-and-manager-bin'
pkgver=0.5.0
pkgrel=1
pkgdesc='Spoof websites trying to gather information about your web navigation—like your browser type and operating system—to deliver distinct content you may not want.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/user-agent-string-switcher/'
license=('MPL-2.0')
depends=('firefox')
_source_file_id=4098688
source=('user_agent_string_switcher.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/user_agent_string_switcher-${pkgver}.xpi")
noextract=('user_agent_string_switcher.xpi')
sha256sums=('9dc8da3c8c46d4f04d12fd789c63501fa6a2f502f859b286939a090db63eae33')

package() {
  install -Dm644 'user_agent_string_switcher.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/User-AgentSwitcherandManager@webextension.org.xpi"
}
