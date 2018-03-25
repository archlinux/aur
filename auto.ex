defmodule Auto do
  use Tesla

  @pkg "../PKGBUILD"
  @srcinfo "../.SRCINFO"

  @map %{
  "Linux Binaries (32-bit)" => ["i686"],
  "Linux Binaries (64-bit)" => ["x86_64"],
  "Linux Binaries (ARM)" => ["armv6h", "armv7h"],
  }

  def get_html() do
    res = get("https://portal.influxdata.com/downloads")
    res.body
  end

  def parse(html) do
    m = html
    |> Floki.find("#influxdb-modal h4")
    |> Enum.filter(fn {"h4", _, items} ->
      Enum.any?(@map, fn {key, value} ->
        items
        |> Floki.text()
        |> String.contains?(key)
      end)
    end)
    |> Enum.flat_map(fn {"h4", _, [arch | _] = items} ->
      arches = Map.fetch!(@map, String.trim(arch))
      checksum = items |> Floki.find("code") |> Floki.text()
      arches |> Enum.map(fn ar -> {ar, checksum} end)
    end)
    |> Enum.into(Map.new())

    version_string = html |> Floki.find("#influxdb-modal .modal-title") |> Floki.text()
    [_, version] = Regex.run(~r/.*v(.*)/, version_string)

"""
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: HUANG Wei <grubbyfans at gmail dot com>

pkgname=influxdb-bin
pkgver=#{version}
pkgrel=1
pkgdesc="An open source agent for collecting metrics and data on the system; Binary release"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/influxdata/influxdb"
license=('MIT')
depends=("glibc")
conflicts=('influxdb')
backup=('etc/influxdb/influxdb.conf')
install=influxdb.install

source_i686=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_i386.tar.gz")
sha256sums_i686=('#{m["i686"]}')
source_x86_64=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('#{m["x86_64"]}')
source_armv6h=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv6h=('#{m["armv6h"]}')
source_armv7h=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv7h=('#{m["armv7h"]}')
source=('influxdb.sysusers' 'influxdb.tmpfiles' 'LICENSE')
sha256sums=('a5ffcdb6db92ed33eccd14a93f1243c18d0d64724de641730af451c99642d6d6' 'e2aa59413a6204737383b86cedefd866d7073f56ace5b89aad38c530cc86e60c' 'bece49bfc61abbb9d0b69bebb47955a44617ada83186c95db5651cd40c0a867a')

package() {
  cd $srcdir/influxdb-$pkgver-$pkgrel
  install -Dm644 ../influxdb.sysusers "$pkgdir/usr/lib/sysusers.d/influxdb.conf"
  install -Dm644 ../influxdb.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/influxdb.conf"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/influxdb-bin/LICENSE"

  install -Dm755 usr/bin/influxd "$pkgdir/usr/bin/influxd"
  install -Dm755 usr/bin/influx "$pkgdir/usr/bin/influx"
  install -Dm644 usr/lib/influxdb/scripts/influxdb.service "$pkgdir/usr/lib/systemd/system/influxdb.service"
  install -Dm644 etc/influxdb/influxdb.conf "$pkgdir/etc/influxdb/influxdb.conf"
  install -Dm644 etc/logrotate.d/influxdb "$pkgdir/etc/logrotate.d/influxdb"
}
"""
  end

  def process(content) do
    File.write!(@pkg, content)

    System.cmd("makepkg", ["--printsrcinfo", ">", "#{@srcinfo}"])
  end

  def run() do
    get_html()
    |> parse()
    |> process()
  end
end
