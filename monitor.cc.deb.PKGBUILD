# Maintainer: Moses Narrow <moses@skycoin.com>
source monitor.PKGBUILD
pkgdesc="${pkgdesc} debian package"
_pkgarches=('amd64' 'arm64' 'armhf' 'armel')
_pkgrel=${pkgrel}
license=('license-free')
depends=("gnu-netcat" "ansifilter" "expect")
_service=("skywire-monitor.service")
_serviceconf=("override.conf")
_source=(
"${_service[@]}"
"${_serviceconf[@]}"
"${install}"
)
source=("${_source[@]}")
sha256sums=('72c189a1c1994e90cab0ab3e21a3bf2932b229210a0bc9e296d6a4400e2a52a1'
            'f26f0d3aa3baeb22fe1f0c94fe86113a638195f0070c5a2cd80e72463de5319a'
            'bb44fa8eba36636b4e766030634737cbc85e2203906a0b25e42c23645e0563cd')


build() {
_msg2 'creating the DEBIAN/control files'
for i in ${_pkgarches[@]}; do
_msg2 "_pkgarch=$i"
local _pkgarch=$i
#create control file for the debian package
echo "Package: ${pkgname}" > ${srcdir}/${_pkgarch}.control
echo "Version: ${pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
echo "Section: web" >> ${srcdir}/${_pkgarch}.control
echo "Architecture:  ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
echo "Provides: ${_pkgname}" >> ${srcdir}/${_pkgarch}.control
echo "Maintainer: Skycoin" >> ${srcdir}/${_pkgarch}.control
echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
done
}


package() {
  for _i in "${_pkgarches[@]}"; do
  _msg2 "_pkgarch=${_i}"
  local _pkgarch="${_i}"
  #set up to create a .deb package
  _debpkgdir="${pkgname}-${pkgver}-${pkgrel}-${_pkgarch}"
  _pkgdir="${pkgdir}/${_debpkgdir}"
  [[ -d "${_pkgdir}" ]] && rm -rf "${_pkgdir}"
  #declare the _pkgdir and systemd directory${_githuborg}
  _systemddir="etc/systemd/system"
  _package
  _msg2 'installing control file and install scripts'
  install -Dm755 "${srcdir}/${_pkgarch}.control" "${_pkgdir}/DEBIAN/control"
  _msg2 'creating debian install scripts'
  echo -e "#!/bin/sh \n systemctl is-active --quiet skywire && systemctl daemon-reload && systemctl restart skywire && systemctl enable --now skywire-monitor 2> /dev/null" | tee "${_pkgdir}/DEBIAN/postinst.sh"
  echo -e "#!/bin/sh \n systemctl is-active --quiet skywire && systemctl daemon-reload && systemctl restart skywire" | tee "${_pkgdir}/DEBIAN/postrm.sh"
  chmod +x ${_pkgdir}/DEBIAN/*
  _msg2 'creating the debian package'
  #create the debian package!
  cd "${pkgdir}"
  dpkg-deb --build -z9 "${_debpkgdir}"
  mv *.deb ../../
  done
  #exit so the arch package doesn't get built
  exit
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF} ${mesg}${ALL_OFF}\n" "$@"
}
