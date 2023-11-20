# Maintainer: egoroff <egoroff@gmail.com>
pkgname=grok-tool-bin
pkgver=0.2.18
pkgrel=1
arch=('x86_64')
pkgdesc="GROK is a tool like UNIX grep on steroids. Ofter regular expressions become huge and vague. To resolve this situation macros or grok could be applied. Grok is a peculiar regular expression's macros name."
url="https://github.com/aegoroff/grok"
license=('MIT')
source=("https://github.com/aegoroff/grok/releases/download/${pkgver}/grok-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('390f8900d127a76a4a51616b29db20049bd759157e9b871fa2bab5b27baa23aa')

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
