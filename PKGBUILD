# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: CrookedNixon <cn@crookednixon.com>
pkgname='smtp-cli'
pkgver='3.6'
pkgrel='1'
pkgdesc='Perl based command line SMTP client'
arch=('any')
url='http://www.logix.cz/michal/devel/smtp-cli'
license=('GPL')
depends=('perl' 'perl-io-socket-ssl' 'perl-io-socket-inet6' 'perl-mime-lite' 'perl-file-type' 'perl-term-readkey' 'perl-digest-hmac' 'perl-email-date-format')
source=("http://www.logix.cz/michal/devel/smtp-cli/${pkgname}-${pkgver}")
sha256sums=('39b902bcb98d0b3d58be04656f6eecbf8bf090d8de7cc4a7bc30dcae71dd0417')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
