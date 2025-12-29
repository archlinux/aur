# Maintainer: egoroff <egoroff@gmail.com>
pkgname=grok-tool-bin
pkgver=0.3.2
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="GROK is a tool like UNIX grep on steroids. Ofter regular expressions become huge and vague. To resolve this situation macros or grok could be applied. Grok is a peculiar regular expression's macros name."
url="https://github.com/aegoroff/grok"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/grok/releases/download/${pkgver}/grok-${pkgver}-x86_64-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/grok/releases/download/${pkgver}/grok-${pkgver}-aarch64-linux-musl.tar.gz")
sha256sums_x86_64=('b26f793af9df1f7fa47622e305f9fb413e177e5e251011111e474b647eee6a63')
sha256sums_aarch64=('162dbedd251f3de2475abb13fdca197deb7eaabf135c5ff6332262bbae0ea96f')

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
