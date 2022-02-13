# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=privateness
_pkgname=privateness
_pkgname1=skycoin
_githuborg=NESS-Network
_githuborg1=skycoin
pkgdesc="NESS Core and Wallet. privateness.network. debian package"
pkgver='0.27.1'
_pkgver=${pkgver}
pkgrel=1
_pkgrel=${pkgrel}
arch=('x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
_pkgarch=$(dpkg --print-architecture)
_pkggopath="github.com/${_githuborg}/${_pkgname}"
_pkggopath1="github.com/${_githuborg1}/${_pkgname1}"
url="https://${_pkggopath}"
_url1="https://${_pkggopath1}"
makedepends=('git' 'go' 'musl' 'kernel-headers-musl')
source=("git+${_url1}.git#branch=${BRANCH:-develop}"
"git+${url}.git#branch=${BRANCH:-karen}"
"privateness.png"
"com.privateness.Privateness.desktop")
sha256sums=('SKIP'
            'SKIP'
            'cb8a2696110ef59f97d5cd31d0bf77342a4f114fa30cb507c960b55783de331f'
            'd2f7c042c64477ddede76734cc3316a754b70ea6c091fbc11a92e94de2b1e2d1')

	prepare() {
    mkdir -p ${srcdir}/go/src/github.com/${_githuborg1}/ ${srcdir}/go/bin
    ln -rTsf ${srcdir}/${_pkgname1} ${srcdir}/go/src/${_pkggopath1}
  }

build() {
  export GOPATH=${srcdir}/go
	export GOBIN=${GOPATH}/bin
  export CC=musl-gcc
  export CGO_ENABLED=1
  #mv ${srcdir}/${_pkgname}/fiber.toml ${srcdir}/${_pkgname1}/fiber.toml
	_cmddir=${srcdir}/go/src/${_pkggopath1}/cmd
  cd ${srcdir}/go/src/${_pkggopath1}/
  go run cmd/newcoin/newcoin.go createcoin --coin ${_pkgname}
  #_buildbins address_gen
  _buildbins cipher-testdata
  _buildbins monitor-peers
  _buildbins newcoin
  _buildbins privateness
  _buildbins skycoin-cli
 #binary transparency
	cd $GOBIN
	_msg2 'binary sha256sums'
	sha256sum $(ls)
  #create wallet launcher script
echo -e "#!/bin/bash
#launch ness wallet
privateness -gui-dir=/opt/privateness/src/gui/static/ -launch-browser=true -enable-all-api-sets=true -enable-gui=true -log-level=debug" > ness-wallet

  ### CONTROL FILES CREATION ###
  #create control file for the debian package
  echo "Package: ${_pkgname}" > ${srcdir}/control
  echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/control
  echo "Priority: optional" >> ${srcdir}/control
  echo "Section: web" >> ${srcdir}/control
  echo "Architecture: ${_pkgarch}" >> ${srcdir}/control
  echo "Depends: ${_debdeps}" >> ${srcdir}/control
  echo "Maintainer: Moses Narrow" >> ${srcdir}/control
  echo "Description: ${pkgdesc}" >> ${srcdir}/control
}

_buildbins() {
_binname=$1
_msg2 "building ${_binname} binary"
	cd ${_cmddir}/${_binname}
  go build -trimpath --ldflags '-linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ .
}

package() {
  _debpkgdir="${_pkgname}-${_pkgver}-${_pkgrel}-${_pkgarch}"
  echo "${_debpkgdir}"
  _pkgdir="${pkgdir}/${_debpkgdir}"
  mkdir -p ${_pkgdir}/
  #create directory trees
	_nesssrcdir=${srcdir}/${_pkgname}
  _nesspath=${_pkgdir}/opt/${_pkgname}
  _nessgobin=${_nesspath}/bin
  _nessguidir=${_nesspath}/src/gui
	mkdir -p ${_pkgdir}/usr/bin
	mkdir -p ${_nessgobin}
	mkdir -p ${_nessguidir}
	#install binaries & symlink to /usr/bin
	_msg2 'installing binaries'
	_nessbin="${srcdir}"/go/bin
	#collect the binaries & install
	_nessbins=$( ls "$_nessbin")
	for i in $_nessbins; do
		install -Dm755 ${srcdir}/go/bin/${i} ${_nessgobin}/${i}
		ln -rTsf ${_nessgobin}/$i ${_pkgdir}/usr/bin/${i}
		chmod 755 ${_pkgdir}/usr/bin/${i}
	done
  _msg2 'installing gui sources'
	#install the web dir (UI)
	cp -r ${_nesssrcdir}/src/gui/static ${_nessguidir}
  _msg2 'correcting symlink names'
	#correct symlink names
	cd ${_pkgdir}/usr/bin/
  mv newcoin privateness-newcoin
  mv skycoin-cli privateness-cli
  #mv address_gen privateness-address-gen
  mv cipher-testdata privateness-cipher-testdata
  mv monitor-peers privateness-monitor-peers
  ##########################################
  _msg2 'installing control file'
  install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control
  _msg2 'creating the debian package'
  #create the debian package
  cd $pkgdir
  dpkg-deb --build -z9 ${_debpkgdir}
  mv *.deb ../../
  #exit so the arch package doesn't get built
  exit
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
