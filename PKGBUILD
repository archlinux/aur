# Maintainer: Bruno Galeotti <bgaleotti AT gmail DOT com>
pkgname=blackfire-cli
pkgver=0.25.3
pkgrel=1
pkgdesc='Blackfire Profiler - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license='custom'
source_i686=("http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_386")
source_x86_64=("http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_amd64")
sha512sums_i686=('b87117f3bbdcdd55d7910278f0c74144fc802764d5782ed18ae93d14115e24d87ae669c0979ebf33df4350cc5bc02f48d7074e1b192130a959f22393296ced51')
sha512sums_x86_64=('759a55aa7edd84a59831d7ecf5dca4ceea2747759cf332c5b0e5d482861d4e027aca5da3e79fcb7ecdbea9830a1eaa87a4c63c843dcf793c414550d3289b64e6')

package(){
  install -Dm 755 blackfire-cli-linux_* ${pkgdir}/usr/bin/blackfire
}
