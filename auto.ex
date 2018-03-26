defmodule Auto do
  use Tesla

  @pkg "PKGBUILD"
  @srcinfo ".SRCINFO"

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
    |> Floki.find("#kapacitor-modal h4")
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

    version_string = html |> Floki.find("#kapacitor-modal .modal-title") |> Floki.text()
    [_, version] = Regex.run(~r/.*v(.*)/, version_string)

"""
# Maintainer: Gareth Dunstone <gareth.dunstone@anu.edu.au>

pkgname=kapacitor-bin
pkgver=#{version}
pkgrel=1
pkgdesc="An open source agent for collecting metrics and data on the system; Binary release"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/influxdata/kapacitor"
license=('MIT')
depends=("")
conflicts=('kapacitor')
backup=('etc/kapacitor/kapacitor.conf')
install=kapacitor.install

source_i686=(kapacitor.tar.gz::"https://dl.influxdata.com/kapacitor/releases/kapacitor-${pkgver}_linux_i386.tar.gz")
sha256sums_i686=('#{m["i686"]}')
source_x86_64=(kapacitor.tar.gz::"https://dl.influxdata.com/kapacitor/releases/kapacitor-${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('#{m["x86_64"]}')
source_armv6h=(kapacitor.tar.gz::"https://dl.influxdata.com/kapacitor/releases/kapacitor-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv6h=('#{m["armv6h"]}')
source_armv7h=(kapacitor.tar.gz::"https://dl.influxdata.com/kapacitor/releases/kapacitor-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv7h=('#{m["armv7h"]}')
source=('kapacitor.sysusers' 'kapacitor.tmpfiles' 'LICENSE')
sha256sums=('94aa16ca0b89b1773abb2333d03233921effccc9461ca1491eba42688a1505bd' '94aa16ca0b89b1773abb2333d03233921effccc9461ca1491eba42688a1505bd' '94aa16ca0b89b1773abb2333d03233921effccc9461ca1491eba42688a1505bd')

package() {
  cd $srcdir/kapacitor-$pkgver-$pkgrel
  install -Dm644 ../kapacitor.sysusers "$pkgdir/usr/lib/sysusers.d/kapacitor.conf"
  install -Dm644 ../kapacitor.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/kapacitor.conf"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/kapacitor-bin/LICENSE"

  install -Dm755 usr/bin/kapacitord "$pkgdir/usr/bin/kapacitord"
  install -Dm755 usr/bin/kapacitor "$pkgdir/usr/bin/kapacitor"
  install -Dm644 usr/lib/kapacitor/scripts/kapacitor.service "$pkgdir/usr/lib/systemd/system/kapacitor.service"
  install -Dm644 etc/kapacitor/kapacitor.conf "$pkgdir/etc/kapacitor/kapacitor.conf"
  install -Dm644 etc/logrotate.d/kapacitor "$pkgdir/etc/logrotate.d/kapacitor"
}
"""
  end

  def process(content) do
    IO.puts "Working directory #{System.cwd!()}"
    File.write!(@pkg, content)

    {output, _code} = System.cmd("makepkg", ["--printsrcinfo"])
    File.write(@srcinfo, output)
  end

  def run() do
    get_html()
    |> parse()
    |> process()
  end
end
