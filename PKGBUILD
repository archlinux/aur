# Maintainer: egoroff <egoroff@gmail.com>
pkgname=grok-tool-bin
pkgver=0.2.32
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="GROK is a tool like UNIX grep on steroids. Ofter regular expressions become huge and vague. To resolve this situation macros or grok could be applied. Grok is a peculiar regular expression's macros name."
url="https://github.com/aegoroff/grok"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/grok/releases/download/${pkgver}/grok-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/grok/releases/download/${pkgver}/grok-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('dd46a11bc8e90a92ebc43499ee7f524d5683ff619adf675af403d6316732eeef')
sha256sums_aarch64=('f46fa04f37fda48045dd2bc4f52ad93bff89294058217dd278bc3bf8ddbe91b6')

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
