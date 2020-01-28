# Maintainer: Guillaume Horel <thrasibule@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ejabberd-git
pkgrel=1
pkgdesc="Jabber server written in Erlang"
pkgver=20.01.3.g20c0fed45
arch=('x86_64')
url="https://www.ejabberd.im/"
license=("GPL")
provides=("ejabberd=$pkgver")
conflicts=('ejabberd')
depends=('expat' 'openssl' 'zlib' 'erlang-nox' 'pam' 'iproute2' 'erlang-unixodbc'
	 'libyaml' 'sqlite' 'gd')
makedepends=('git' 'rebar' 'hevea' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
optdepends=('gsfonts: for captcha'
	    'imagemagick: for captcha')
backup=('etc/ejabberd/ejabberd.yml'
	'etc/ejabberd/ejabberdctl.cfg'
	'etc/logrotate.d/ejabberd')
options=(emptydirs)
source=("${pkgname}::git+https://github.com/processone/ejabberd#branch=master"
	"base64url::git://github.com/dvv/base64url.git#commit=f2c64ed8b9bebc536fad37ad97243452b674b837"
	"cache_tab::git://github.com/processone/cache_tab#commit=ee1b27bc64322e87b26e045779dd284dc217a998"
	"eimp::git://github.com/processone/eimp#commit=9585ed6dc5473454ff6f27dedd7825474a4ccf40"
	"elixir::git://github.com/elixir-lang/elixir#commit=867da6f876c48279823a41a33030c95ef37379b2"
	"epam::git://github.com/processone/epam#commit=7d4d359c2862bd2d0ad5f3f641bade64aed8f35b"
	"eredis::git://github.com/wooga/eredis#commit=cbc013f516e464706493c01662e5e9dd82d1db01"
	"esip::git://github.com/processone/esip#commit=a58fdd16ddc02af03261f0642e789e2738d7eb5d"
	"ezlib::git://github.com/processone/ezlib#commit=3bfd5bf53a6a6a58278aca354b56ab4f911a6c0d"
	"fast_tls::git://github.com/processone/fast_tls#commit=2ec26b6a596efa5f3be0cd2e06ec54f2779a08e7"
	"fast_xml::git://github.com/processone/fast_xml#commit=5f6aa4492ff8f601eb5b179e5280c8a8adf750fb"
	"fast_yaml::git://github.com/processone/fast_yaml#commit=e7fb1c591c7d18aba4853bc2118794ec6fa565d4"
	"goldrush::git://github.com/DeadZen/goldrush.git#commit=8f1b715d36b650ec1e1f5612c00e28af6ab0de82"
	"idna::git://github.com/benoitc/erlang-idna#commit=6cff72747821110169ecfac871b0c69e5064afff"
	"jiffy::git://github.com/davisp/jiffy#commit=1febce3ca86c5ca5d5a3618ed3d5f125bb99e4c5"
	"jose::git://github.com/potatosalad/erlang-jose#commit=5ad99d03c5381ec68a9576c81ed4e9312fea73e0"
	"lager::git://github.com/erlang-lager/lager#commit=4ffdf0dbef53304bc0e958a00776bf0650de8c8b"
	"luerl::git://github.com/rvirding/luerl#commit=01fa43a1a5d68becfe07236a9a71505039474108"
	"mqtree::git://github.com/processone/mqtree#commit=501ad10fd43e988ba6ebc75cc732a0667e236a40"
	"p1_acme::git://github.com/processone/p1_acme.git#commit=0ec60cb929ba625f9c8dd8354c83588f048b4f8b"
	"p1_mysql::git://github.com/processone/p1_mysql#commit=b3edaa2ca29fd073dd7620ba7282c752af7ec28d"
	"p1_oauth2::git://github.com/processone/p1_oauth2#commit=57434e2e07530e9026159f891059eb808b08eae3"
	"p1_pgsql::git://github.com/processone/p1_pgsql#commit=7db1347e487114b128fe805e1d329336ebda803e"
	"p1_utils::git://github.com/processone/p1_utils#commit=6287a621c93a34d4f45a3844c8d1c7ef72dd0dfb"
	"pkix::git://github.com/processone/pkix#commit=c204ea8dfd20473c866da0cb85691a1f77ef0bb8"
	"rebar_elixir_plugin::git://github.com/processone/rebar_elixir_plugin#commit=10614dfef5d10b7071f7181858149259e50159f6"
	"sqlite3::git://github.com/processone/erlang-sqlite3#commit=cedc45a668d7630f942cab1c6f695de14b097e05"
	"stringprep::git://github.com/processone/stringprep#commit=ff2a90011d4b2014a96a3c5675447b3cd144aaf1"
	"stun::git://github.com/processone/stun#commit=2a02761a6f7b09719005c27a632abfeeac21120a"
	"unicode_util_compat::git://github.com/benoitc/unicode_util_compat.git#commit=38d7bc105f51159e8ea3279c40121db9db1e652f"
	"xmpp::git://github.com/processone/xmpp#commit=9e236a64ebb5c8d66bce6bde31adb6196e4dfe6d"
	"yconf::git://github.com/processone/yconf#commit=b40af2f95b33465e7cabf408478c7d56830e4a85"
	"${pkgname%%-git}.logrotate"
	"sysuser.conf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a2d5b500d31c64a6a76effaad4335521161ec135d0f5706a9419acfedbffdbc8'
            '68de8fd4df6e4f0e21a241dcd2b7075bdff495876646dd726c7054bf5780e3c6')

pkgver() {
  cd "${srcdir}/$pkgname"
  #printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
  git describe --long --tags | sed 's/^v//; s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p "$srcdir/$pkgname/deps"
  for i in \
    base64url cache_tab eimp elixir epam eredis esip ezlib fast_tls fast_xml fast_yaml goldrush idna jiffy jose lager luerl mqtree p1_acme p1_mysql p1_oauth2 p1_pgsql p1_utils pkix rebar_elixir_plugin sqlite3 stringprep stun unicode_util_compat xmpp yconf \
    ; do
    rm -rf "$srcdir/$pkgname/deps/$i"
    mv "$srcdir"/$i "$srcdir/$pkgname/deps"
  done
  sed -i "s/sed[^|]*/sed 's\/-\/.\/g'/" configure.ac
}

build() {
  cd "$srcdir/$pkgname"
  [ -x configure ] || ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-all
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install

  sed -i \
    -e "s|$pkgdir||g" \
    -e "s|Group=.*|Group=jabber|g" \
    -e "s|User=.*|User=jabber|g" \
    ejabberd.service
  install -Dm0644 ejabberd.service "$pkgdir"/usr/lib/systemd/system/ejabberd.service

  install -Dm04750 deps/epam/priv/bin/epam "$pkgdir"/usr/lib/ejabberd-$pkgver/priv/bin/epam
  install -d "$pkgdir/var/lib/${pkgname%%-git}"
  install -D -m0644 "$srcdir/${pkgname%%-git}.logrotate" "$pkgdir/etc/logrotate.d/${pkgname%%-git}"
  chmod ug+r "$pkgdir/etc/${pkgname%%-git}/"*
  chmod a+rx "$pkgdir/usr/bin/ejabberdctl" "$pkgdir/usr/lib/ejabberd-$pkgver/priv/bin/captcha.sh"
  rm -rf "$pkgdir/var/lock"
  install -Dm644 "$srcdir"/sysuser.conf "$pkgdir"/usr/lib/sysusers.d/ejabberd.conf
  install -Dm644 tools/ejabberdctl.bc "$pkgdir"/usr/share/bash-completion/completions/ejabberdctl

  # workaround
  ln -s mod_configure.beam "$pkgdir"/usr/lib/ejabberd-$pkgver/ebin/configure.beam
  rm -f "$pkgdir"/usr/bin/{elixir,iex,mix}

  echo -e "\n\n# home dir workaround\nHOME=/var/lib/ejabberd" >>"$pkgdir"/etc/ejabberd/ejabberdctl.cfg

  # /usr/lib/ejabberd symlink follows to ejabberd version
  ln -s ejabberd-$pkgver "$pkgdir"/usr/lib/ejabberd

  # permissions
  chown -R 17:17 "$pkgdir"/var/{lib,log}/ejabberd
  chown root:17 \
    "$pkgdir"/etc/ejabberd/ejabberd.yml \
    "$pkgdir"/etc/ejabberd/ejabberdctl.cfg \
    "$pkgdir"/etc/ejabberd \
    "$pkgdir"/usr/lib/ejabberd/priv/bin/epam

  # fix eimp
  chmod a+x "$pkgdir"/usr/lib/eimp-*/priv/bin/eimp
}

# vim:set ts=2 sw=2 et:
