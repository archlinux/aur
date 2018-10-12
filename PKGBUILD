# Maintainer: James Harvey <jamespharvey20 at gmail dot com>
# * No namcap warnings or errors

pkgname=bash-git-prompt
pkgver=2.7.1
pkgrel=1
pkgdesc="Informative git prompt for bash and fish"
arch=('any')
url="https://github.com/magicmonty/bash-git-prompt"
depends=('bash')
optdepends=('fish: git prompt in fish support')
makedepends=('git')
license=('custom:BSD 2 Clause (NetBSD)')
source=("https://github.com/magicmonty/${pkgname}/archive/${pkgver}.tar.gz"
        'bash-git-prompt.install'
        'Default_Arch.bgptheme')
md5sums=('a32d4fa3996a81e7b2deb26d80d39b22'
         '9024256781844b2af5da4da4882e9160'
         'af064330b3a579ec6efd2e018e6829df')
install='bash-git-prompt.install'

package() {
  cd ${srcdir}/bash-git-prompt-${pkgver}

  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 README.md ${pkgdir}/usr/lib/bash-git-prompt/README.md
  install -Dm755 git-prompt-help.sh ${pkgdir}/usr/lib/bash-git-prompt/git-prompt-help.sh
  install -Dm644 gitprompt.fish ${pkgdir}/usr/lib/bash-git-prompt/gitprompt.fish
  install -Dm755 gitprompt.sh ${pkgdir}/usr/lib/bash-git-prompt/gitprompt.sh
  install -Dm755 gitstatus.sh ${pkgdir}/usr/lib/bash-git-prompt/gitstatus.sh
  install -Dm644 prompt-colors.sh ${pkgdir}/usr/lib/bash-git-prompt/prompt-colors.sh

  cd themes
  install -Dm644 Chmike.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Chmike.bgptheme
  install -Dm644 Crunch.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Crunch.bgptheme
  install -Dm644 Custom.bgptemplate ${pkgdir}/usr/lib/${pkgname}/themes/Custom.bgptemplate
  install -Dm644 Default.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Default.bgptheme
  install -Dm644 ${srcdir}/Default_Arch.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Default_Arch.bgptheme
  install -Dm644 Default_NoExitState.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Default_NoExitState.bgptheme
  install -Dm644 Evermeet.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Evermeet.bgptheme
  install -Dm644 Evermeet_Lowres.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Evermeet_Lowres.bgptheme
  install -Dm644 Minimal.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Minimal.bgptheme
  install -Dm644 Minimal_UserHost.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Minimal_UserHost.bgptheme
  install -Dm644 Plague_Doctor.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Plague_Doctor.bgptheme
  install -Dm644 Single_line.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Single_line.bgptheme
  install -Dm644 Single_line_Dark.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Single_line_Dark.bgptheme
  install -Dm644 Single_line_Minimalist.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Single_line_Minimalist.bgptheme
  install -Dm644 Single_line_NoExitState.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Single_line_NoExitState.bgptheme
  install -Dm644 Single_line_Solarized.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Single_line_Solarized.bgptheme
  install -Dm644 Single_line_Solarized_Lamda.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Single_line_Solarized_Lamda.bgptheme
  install -Dm644 Solarized.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Solarized.bgptheme
  install -Dm644 Solarized_Extravagant.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Solarized_Extravagant.bgptheme
  install -Dm644 Solarized_NoExitState.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Solarized_NoExitState.bgptheme
  install -Dm644 Solarized_UserHost.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Solarized_UserHost.bgptheme
  install -Dm644 TruncatedPwd_WindowTitle.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/TruncatedPwd_WindowTitle.bgptheme
  install -Dm644 TruncatedPwd_WindowTitle_NoExitState.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/TruncatedPwd_WindowTitle_NoExtraState.bgptheme
}
