# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ejabberd
pkgver=18.06
pkgrel=3
pkgdesc="Jabber server written in Erlang"
arch=('x86_64')
url="http://www.ejabberd.im/"
license=("GPL")
depends=('expat' 'openssl' 'zlib' 'erlang-nox' 'pam' 'iproute2' 'erlang-unixodbc'
	 'libyaml' 'sqlite' 'gd')
makedepends=('git' 'rebar' 'hevea' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
backup=('etc/ejabberd/ejabberd.yml'
	'etc/ejabberd/ejabberdctl.cfg'
	'etc/logrotate.d/ejabberd')
options=(emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/processone/ejabberd/archive/$pkgver.tar.gz"
	"base64url::git://github.com/dvv/base64url.git#commit=f2c64ed8b9bebc536fad37ad97243452b674b837"
	"cache_tab::git://github.com/processone/cache_tab#commit=62bdf85216dd39c8082b6e23b95f28068796c813"
	"eimp::git://github.com/processone/eimp#commit=94b7715d5f9776712f791133cd6389e6c171a997"
	"elixir::git://github.com/elixir-lang/elixir#commit=867da6f876c48279823a41a33030c95ef37379b2"
	"epam::git://github.com/processone/epam#commit=c4940ad96c9e734865d54df45af6f90c1c4ce03b"
	"eredis::git://github.com/wooga/eredis#commit=cbc013f516e464706493c01662e5e9dd82d1db01"
	"esip::git://github.com/processone/esip#commit=1c51157360e09cd07d359859b0f9511277afb042"
	"ezlib::git://github.com/processone/ezlib#commit=ccfb3b25c6476894c3e8d835d35ff258f64e9e14"
	"fast_tls::git://github.com/processone/fast_tls#commit=4df74a4f55542712f1adbfe980c343460cce6b3a"
	"fast_xml::git://github.com/processone/fast_xml#commit=532b3ca7675724f82609035b5776351d5d25cb28"
	"fast_yaml::git://github.com/processone/fast_yaml#commit=50045ece8ab5c038f604ea4bb04fef2b4471973d"
	"goldrush::git://github.com/DeadZen/goldrush.git#commit=8f1b715d36b650ec1e1f5612c00e28af6ab0de82"
	"hamcrest::git://github.com/basho/hamcrest-erlang.git#commit=ad3dbab419762fc2d5821abb88b989da006b85c6"
	"iconv::git://github.com/processone/iconv#commit=50e79c9baecfb7ab3ca51033c75adec883929942"
	"jiffy::git://github.com/davisp/jiffy#commit=1febce3ca86c5ca5d5a3618ed3d5f125bb99e4c5"
	"jose::git://github.com/potatosalad/erlang-jose#commit=f8f97fb651202386c951fccfcb61d123518ba05f"
	"lager::git://github.com/erlang-lager/lager#commit=a10c23c51dea6bbd63e5048c8a5a702169973114"
	"luerl::git://github.com/rvirding/luerl#commit=01fa43a1a5d68becfe07236a9a71505039474108"
	"meck::git://github.com/eproxus/meck#commit=70d6a33ce7407029dc59e22a5b3c1c61c1348b23"
	"moka::git://github.com/processone/moka#commit=6b1ead5821423fa5d465795f99f59f211e708583"
	"p1_mysql::git://github.com/processone/p1_mysql#commit=72cbfc377dcfee555034e98583e4dc340be5ade5"
	"p1_oauth2::git://github.com/processone/p1_oauth2#commit=ab44e27db49021321e1a5d4dcf65c6c65c088075"
	"p1_pgsql::git://github.com/processone/p1_pgsql#commit=df6f8819eb46a8c490ba95b1fda66347970111dc"
	"p1_utils::git://github.com/processone/p1_utils#commit=4916fd9358762e42081bd454df07ee9f1d7b6836"
	"rebar_elixir_plugin::git://github.com/processone/rebar_elixir_plugin#commit=10614dfef5d10b7071f7181858149259e50159f6"
	"riakc::git://github.com/processone/riak-erlang-client#commit=63db9859cf478cc67d4149940a5a9eae8c5ca3bc"
	"riak_pb::git://github.com/basho/riak_pb#commit=08771aba2ce4935b715d32d1b92555efdc3da994"
	"samerlib::git://github.com/processone/samerlib#commit=61fdc411c0aa902d63d73ca3410a8d8afcd39283"
	"sqlite3::git://github.com/processone/erlang-sqlite3#commit=cedc45a668d7630f942cab1c6f695de14b097e05"
	"stringprep::git://github.com/processone/stringprep#commit=6d4aa85a7a7a98c3239b18c136b75454e716cede"
	"stun::git://github.com/processone/stun#commit=8a0e7d4ee5930ad27f44c1ce6cc5f695f1f7b9d5"
	"xmpp::git://github.com/processone/xmpp#commit=0a4397bbf7aeace5b1ae47fb64627edcc8d838e6"
	"$pkgname.logrotate"
	"ejabberd.service"
	"sysuser.conf")
sha256sums=('aed37efa45387a4404bd9bcef3072d7490d9b7edf055c993444130b5ab24e529'
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
            'SKIP'
            '31780cac78736d285e46f445f8c8463a70f2aeb2683280c259129db11832ddd2'
            '94582b1df76f6d86abfcc78bf4c4ac79276761c75483dd40a45b7ff2b19dc8a8'
            '68de8fd4df6e4f0e21a241dcd2b7075bdff495876646dd726c7054bf5780e3c6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$srcdir/$pkgname-$pkgver/deps"
  for i in \
    base64url cache_tab eimp elixir epam eredis esip ezlib fast_tls fast_xml fast_yaml goldrush hamcrest iconv jiffy jose lager luerl meck moka p1_mysql p1_oauth2 p1_pgsql p1_utils rebar_elixir_plugin riakc riak_pb samerlib sqlite3 stringprep stun xmpp \
    ; do
    rm -rf "$srcdir/$pkgname-$pkgver/deps/$i"
    mv "$srcdir"/$i "$srcdir/$pkgname-$pkgver/deps"
  done

  sed -i "s|git describe --tags 2>/dev/null|echo $pkgver|" configure.ac
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
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
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm04750 deps/epam/priv/bin/epam "$pkgdir"/usr/lib/ejabberd-$pkgver/priv/bin/epam
  install -d "$pkgdir/var/lib/$pkgname"
  install -D -m0644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"
  chmod ug+r "$pkgdir/etc/$pkgname/"*
  chmod a+rx "$pkgdir/usr/bin/ejabberdctl" "$pkgdir/usr/lib/ejabberd-$pkgver/priv/bin/captcha.sh"
  rm -rf "$pkgdir/var/lock"
  install -Dm0644 "$srcdir"/ejabberd.service "$pkgdir"/usr/lib/systemd/system/ejabberd.service
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
