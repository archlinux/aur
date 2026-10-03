# Maintainer: egoroff <egoroff@gmail.com>
pkgname=grok-tool-bin
pkgver=0.6.1
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="GROK is a tool like UNIX grep on steroids. Ofter regular expressions become huge and vague. To resolve this situation macros or grok could be applied. Grok is a peculiar regular expression's macros name."
url="https://github.com/aegoroff/grok"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/grok/releases/download/${pkgver}/grok-${pkgver}-x86_64-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/grok/releases/download/${pkgver}/grok-${pkgver}-aarch64-linux-musl.tar.gz")
sha256sums_x86_64=('4e8a3502d05293ca8976f769376bb43fc24817c2e83c8d35c76edc1aa5da26c9')
sha256sums_aarch64=('8f2c7c985b084cdffa9184bc5601ffceace89cc4a181a45e5586cdedb2fe1bd3')

build() {
  return 0
}

package() {

  install -Dm0755 "grok" "$pkgdir/usr/bin/grok"
  install -Dm0644 "custom.patterns" "$pkgdir/usr/share/grok/patterns/custom.patterns"
  install -Dm0644 "grok.patterns" "$pkgdir/usr/share/grok/patterns/grok.patterns"
  install -Dm0644 "linuxsyslog.patterns" "$pkgdir/usr/share/grok/patterns/linuxsyslog.patterns"
  install -Dm0644 "webservers.patterns" "$pkgdir/usr/share/grok/patterns/webservers.patterns"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/grok/LICENSE.txt"
}
