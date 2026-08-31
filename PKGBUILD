# Maintainer: local user
# 预编译二进制包: 不编译源码, 直接打包已编译好的 sipp (x86_64)
# 二进制来源: GitHub Release (https://github.com/Veng0923/sipp/releases)
# 注意: 本包装到 ~/.local/bin/sipp, 与官方 sipp 包不冲突

pkgname=sipp-bin
pkgver=3.7.7
pkgrel=1
pkgdesc="A free open source test tool and traffic generator for the SIP protocol (prebuilt x86_64)"
arch=('x86_64')
url="http://github.com/sipp"
license=('GPL2')
depends=('gcc-libs' 'gsl' 'lksctp-tools' 'libpcap' 'ncurses' 'openssl')
source=("https://github.com/Veng0923/sipp/releases/download/${pkgver}-${pkgrel}/sipp")
sha256sums=('7ce318cd726969870d99dfa491c2f6b0f1507d93ef66707d64341ceb602beedd')

package() {
  install -Dm755 "${srcdir}/sipp" "${pkgdir}${HOME}/.local/bin/sipp"
}
