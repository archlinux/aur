# MAINTAINER: graysky <therealgraysky AT proton DOT me>
pkgbase=openwrt-toolchain
pkgver=20260112
pkgrel=1
pkgdesc='External toolchains for openwrt buildsystem'
arch=(x86_64)
url='https://openwrt.org/docs/guide-developer/external_toolchain'
license=(GPL-2.0-only)
options=(!strip)
_target=/opt/xtools-openwrt

pkgname=(
  openwrt-toolchain-apm821xx-nand
  openwrt-toolchain-apm821xx-sata
  openwrt-toolchain-armsr-armv7
  openwrt-toolchain-armsr-armv8
  openwrt-toolchain-at91-sam9x
  openwrt-toolchain-at91-sama5
  openwrt-toolchain-at91-sama7
  openwrt-toolchain-ath79-generic
  openwrt-toolchain-ath79-mikrotik
  openwrt-toolchain-ath79-nand
  openwrt-toolchain-ath79-tiny
  openwrt-toolchain-bcm27xx-bcm2708
  openwrt-toolchain-bcm27xx-bcm2709
  openwrt-toolchain-bcm27xx-bcm2710
  openwrt-toolchain-bcm27xx-bcm2711
  openwrt-toolchain-bcm27xx-bcm2712
  openwrt-toolchain-bcm47xx-generic
  openwrt-toolchain-bcm47xx-legacy
  openwrt-toolchain-bcm47xx-mips74k
  openwrt-toolchain-bcm4908-generic
  openwrt-toolchain-bcm53xx-generic
  openwrt-toolchain-bmips-bcm6318
  openwrt-toolchain-bmips-bcm63268
  openwrt-toolchain-bmips-bcm6328
  openwrt-toolchain-bmips-bcm6358
  openwrt-toolchain-bmips-bcm6362
  openwrt-toolchain-bmips-bcm6368
  openwrt-toolchain-d1-generic
  openwrt-toolchain-gemini-generic
  openwrt-toolchain-imx-cortexa53
  openwrt-toolchain-imx-cortexa7
  openwrt-toolchain-imx-cortexa9
  openwrt-toolchain-ipq40xx-chromium
  openwrt-toolchain-ipq40xx-generic
  openwrt-toolchain-ipq40xx-mikrotik
  openwrt-toolchain-ipq806x-chromium
  openwrt-toolchain-ipq806x-generic
  openwrt-toolchain-ixp4xx-generic
  openwrt-toolchain-kirkwood-generic
  openwrt-toolchain-lantiq-ase
  openwrt-toolchain-lantiq-xrx200
  openwrt-toolchain-lantiq-xrx200_legacy
  openwrt-toolchain-lantiq-xway
  openwrt-toolchain-lantiq-xway_legacy
  openwrt-toolchain-layerscape-armv7
  openwrt-toolchain-layerscape-armv8_64b
  openwrt-toolchain-loongarch64-generic
  openwrt-toolchain-malta-be
  openwrt-toolchain-malta-be64
  openwrt-toolchain-malta-le
  openwrt-toolchain-malta-le64
  openwrt-toolchain-mediatek-filogic
  openwrt-toolchain-mediatek-mt7622
  openwrt-toolchain-mediatek-mt7623
  openwrt-toolchain-mediatek-mt7629
  openwrt-toolchain-mpc85xx-p1010
  openwrt-toolchain-mpc85xx-p1020
  openwrt-toolchain-mpc85xx-p2020
  openwrt-toolchain-mvebu-cortexa53
  openwrt-toolchain-mvebu-cortexa72
  openwrt-toolchain-mvebu-cortexa9
  openwrt-toolchain-mxs-generic
  openwrt-toolchain-octeon-generic
  openwrt-toolchain-omap-generic
  openwrt-toolchain-pistachio-generic
  openwrt-toolchain-qoriq-generic
  openwrt-toolchain-qualcommax-ipq50xx
  openwrt-toolchain-qualcommax-ipq60xx
  openwrt-toolchain-qualcommax-ipq807x
  openwrt-toolchain-ramips-mt7620
  openwrt-toolchain-ramips-mt7621
  openwrt-toolchain-ramips-mt76x8
  openwrt-toolchain-ramips-rt288x
  openwrt-toolchain-ramips-rt305x
  openwrt-toolchain-ramips-rt3883
  openwrt-toolchain-realtek-rtl838x
  openwrt-toolchain-realtek-rtl839x
  openwrt-toolchain-realtek-rtl930x
  openwrt-toolchain-realtek-rtl930x_nand
  openwrt-toolchain-realtek-rtl931x
  openwrt-toolchain-realtek-rtl931x_nand
  openwrt-toolchain-rockchip-armv8
  openwrt-toolchain-sifiveu-generic
  openwrt-toolchain-siflower-sf21
  openwrt-toolchain-starfive-generic
  openwrt-toolchain-stm32-stm32mp1
  openwrt-toolchain-sunxi-arm926ejs
  openwrt-toolchain-sunxi-cortexa53
  openwrt-toolchain-sunxi-cortexa7
  openwrt-toolchain-sunxi-cortexa8
  openwrt-toolchain-tegra-generic
  openwrt-toolchain-zynq-generic
  openwrt-toolchain-x86-64
  openwrt-toolchain-x86-generic
  openwrt-toolchain-x86-geode
  openwrt-toolchain-x86-legacy
  openwrt-toolchain-bin
)

source=(
  openwrt-toolchain-apm821xx-nand_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/apm821xx/nand/openwrt-toolchain-apm821xx-nand_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-apm821xx-sata_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/apm821xx/sata/openwrt-toolchain-apm821xx-sata_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-armsr-armv7_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/armsr/armv7/openwrt-toolchain-armsr-armv7_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-armsr-armv8_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/armsr/armv8/openwrt-toolchain-armsr-armv8_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-at91-sam9x_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/at91/sam9x/openwrt-toolchain-at91-sam9x_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-at91-sama5_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/at91/sama5/openwrt-toolchain-at91-sama5_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-at91-sama7_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/at91/sama7/openwrt-toolchain-at91-sama7_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-ath79-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ath79/generic/openwrt-toolchain-ath79-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-ath79-mikrotik_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ath79/mikrotik/openwrt-toolchain-ath79-mikrotik_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-ath79-nand_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ath79/nand/openwrt-toolchain-ath79-nand_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-ath79-tiny_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ath79/tiny/openwrt-toolchain-ath79-tiny_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm27xx-bcm2708_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm27xx/bcm2708/openwrt-toolchain-bcm27xx-bcm2708_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm27xx-bcm2709_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm27xx/bcm2709/openwrt-toolchain-bcm27xx-bcm2709_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm27xx-bcm2710_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm27xx/bcm2710/openwrt-toolchain-bcm27xx-bcm2710_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm27xx-bcm2711_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm27xx/bcm2711/openwrt-toolchain-bcm27xx-bcm2711_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm27xx-bcm2712_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm27xx/bcm2712/openwrt-toolchain-bcm27xx-bcm2712_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm47xx-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm47xx/generic/openwrt-toolchain-bcm47xx-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm47xx-legacy_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm47xx/legacy/openwrt-toolchain-bcm47xx-legacy_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm47xx-mips74k_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm47xx/mips74k/openwrt-toolchain-bcm47xx-mips74k_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm4908-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm4908/generic/openwrt-toolchain-bcm4908-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bcm53xx-generic_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bcm53xx/generic/openwrt-toolchain-bcm53xx-generic_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-bmips-bcm6318_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bmips/bcm6318/openwrt-toolchain-bmips-bcm6318_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bmips-bcm63268_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bmips/bcm63268/openwrt-toolchain-bmips-bcm63268_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bmips-bcm6328_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bmips/bcm6328/openwrt-toolchain-bmips-bcm6328_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bmips-bcm6358_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bmips/bcm6358/openwrt-toolchain-bmips-bcm6358_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bmips-bcm6362_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bmips/bcm6362/openwrt-toolchain-bmips-bcm6362_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-bmips-bcm6368_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/bmips/bcm6368/openwrt-toolchain-bmips-bcm6368_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-d1-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/d1/generic/openwrt-toolchain-d1-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-gemini-generic_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/gemini/generic/openwrt-toolchain-gemini-generic_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-imx-cortexa53_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/imx/cortexa53/openwrt-toolchain-imx-cortexa53_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-imx-cortexa7_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/imx/cortexa7/openwrt-toolchain-imx-cortexa7_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-imx-cortexa9_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/imx/cortexa9/openwrt-toolchain-imx-cortexa9_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-ipq40xx-chromium_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ipq40xx/chromium/openwrt-toolchain-ipq40xx-chromium_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-ipq40xx-generic_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ipq40xx/generic/openwrt-toolchain-ipq40xx-generic_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-ipq40xx-mikrotik_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ipq40xx/mikrotik/openwrt-toolchain-ipq40xx-mikrotik_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-ipq806x-chromium_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ipq806x/chromium/openwrt-toolchain-ipq806x-chromium_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-ipq806x-generic_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ipq806x/generic/openwrt-toolchain-ipq806x-generic_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-ixp4xx-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ixp4xx/generic/openwrt-toolchain-ixp4xx-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-kirkwood-generic_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/kirkwood/generic/openwrt-toolchain-kirkwood-generic_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-lantiq-ase_gcc-14.2.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/lantiq/ase/openwrt-toolchain-lantiq-ase_gcc-14.2.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-lantiq-xrx200_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/lantiq/xrx200/openwrt-toolchain-lantiq-xrx200_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-lantiq-xrx200_legacy_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/lantiq/xrx200_legacy/openwrt-toolchain-lantiq-xrx200_legacy_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-lantiq-xway_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/lantiq/xway/openwrt-toolchain-lantiq-xway_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-lantiq-xway_legacy_gcc-14.2.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/lantiq/xway_legacy/openwrt-toolchain-lantiq-xway_legacy_gcc-14.2.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-layerscape-armv7_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/layerscape/armv7/openwrt-toolchain-layerscape-armv7_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-layerscape-armv8_64b_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/layerscape/armv8_64b/openwrt-toolchain-layerscape-armv8_64b_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-loongarch64-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/loongarch64/generic/openwrt-toolchain-loongarch64-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-malta-be_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/malta/be/openwrt-toolchain-malta-be_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-malta-be64_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/malta/be64/openwrt-toolchain-malta-be64_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-malta-le_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/malta/le/openwrt-toolchain-malta-le_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-malta-le64_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/malta/le64/openwrt-toolchain-malta-le64_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-mediatek-filogic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mediatek/filogic/openwrt-toolchain-mediatek-filogic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-mediatek-mt7622_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mediatek/mt7622/openwrt-toolchain-mediatek-mt7622_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-mediatek-mt7623_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mediatek/mt7623/openwrt-toolchain-mediatek-mt7623_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-mediatek-mt7629_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mediatek/mt7629/openwrt-toolchain-mediatek-mt7629_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-mpc85xx-p1010_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mpc85xx/p1010/openwrt-toolchain-mpc85xx-p1010_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-mpc85xx-p1020_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mpc85xx/p1020/openwrt-toolchain-mpc85xx-p1020_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-mpc85xx-p2020_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mpc85xx/p2020/openwrt-toolchain-mpc85xx-p2020_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-mvebu-cortexa53_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mvebu/cortexa53/openwrt-toolchain-mvebu-cortexa53_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-mvebu-cortexa72_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mvebu/cortexa72/openwrt-toolchain-mvebu-cortexa72_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-mvebu-cortexa9_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mvebu/cortexa9/openwrt-toolchain-mvebu-cortexa9_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-mxs-generic_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/mxs/generic/openwrt-toolchain-mxs-generic_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-octeon-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/octeon/generic/openwrt-toolchain-octeon-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-omap-generic_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/omap/generic/openwrt-toolchain-omap-generic_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-pistachio-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/pistachio/generic/openwrt-toolchain-pistachio-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-qoriq-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/qoriq/generic/openwrt-toolchain-qoriq-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-qualcommax-ipq50xx_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/qualcommax/ipq50xx/openwrt-toolchain-qualcommax-ipq50xx_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-qualcommax-ipq60xx_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/qualcommax/ipq60xx/openwrt-toolchain-qualcommax-ipq60xx_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-qualcommax-ipq807x_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/qualcommax/ipq807x/openwrt-toolchain-qualcommax-ipq807x_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-ramips-mt7620_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ramips/mt7620/openwrt-toolchain-ramips-mt7620_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-ramips-mt7621_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/openwrt-toolchain-ramips-mt7621_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-ramips-mt76x8_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ramips/mt76x8/openwrt-toolchain-ramips-mt76x8_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-ramips-rt288x_gcc-14.2.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ramips/rt288x/openwrt-toolchain-ramips-rt288x_gcc-14.2.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-ramips-rt305x_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ramips/rt305x/openwrt-toolchain-ramips-rt305x_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-ramips-rt3883_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/ramips/rt3883/openwrt-toolchain-ramips-rt3883_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-realtek-rtl838x_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/realtek/rtl838x/openwrt-toolchain-realtek-rtl838x_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-realtek-rtl839x_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/realtek/rtl839x/openwrt-toolchain-realtek-rtl839x_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-realtek-rtl930x_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/realtek/rtl930x/openwrt-toolchain-realtek-rtl930x_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-realtek-rtl930x_nand_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/realtek/rtl930x_nand/openwrt-toolchain-realtek-rtl930x_nand_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-realtek-rtl931x_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/realtek/rtl931x/openwrt-toolchain-realtek-rtl931x_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-realtek-rtl931x_nand_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/realtek/rtl931x_nand/openwrt-toolchain-realtek-rtl931x_nand_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-rockchip-armv8_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/rockchip/armv8/openwrt-toolchain-rockchip-armv8_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-sifiveu-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/sifiveu/generic/openwrt-toolchain-sifiveu-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-siflower-sf21_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/siflower/sf21/openwrt-toolchain-siflower-sf21_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-starfive-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/starfive/generic/openwrt-toolchain-starfive-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-stm32-stm32mp1_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/stm32/stm32mp1/openwrt-toolchain-stm32-stm32mp1_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-sunxi-arm926ejs_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/sunxi/arm926ejs/openwrt-toolchain-sunxi-arm926ejs_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-sunxi-cortexa53_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/sunxi/cortexa53/openwrt-toolchain-sunxi-cortexa53_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-sunxi-cortexa7_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/sunxi/cortexa7/openwrt-toolchain-sunxi-cortexa7_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-sunxi-cortexa8_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/sunxi/cortexa8/openwrt-toolchain-sunxi-cortexa8_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-tegra-generic_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/tegra/generic/openwrt-toolchain-tegra-generic_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-zynq-generic_gcc-14.3.0_musl_eabi.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/zynq/generic/openwrt-toolchain-zynq-generic_gcc-14.3.0_musl_eabi.Linux-x86_64.tar.zst
  openwrt-toolchain-x86-64_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/x86/64/openwrt-toolchain-x86-64_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-x86-generic_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/x86/generic/openwrt-toolchain-x86-generic_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-x86-geode_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/x86/geode/openwrt-toolchain-x86-geode_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  openwrt-toolchain-x86-legacy_gcc-14.3.0_musl.Linux-x86_64-20260112.tar.zst::https://downloads.openwrt.org/snapshots/targets/x86/legacy/openwrt-toolchain-x86-legacy_gcc-14.3.0_musl.Linux-x86_64.tar.zst
  map
  externalize_openwrt_toolchain.sh
)

sha256sums=('4e1c27e4bf25d63784e52b46ccd11cbb16904b0a01d65cf881a0b1425934b10e'
            'acd44e590a575215aac87eb46c1f1ff1ec0554e88d2d28781393ae86993cf25b'
            '0ecc897172ad8ba1184815b7279d4ef817efc08de0598a6484bfe29ad464d74b'
            'ae3163ec99e1aaf05e21c74274954525c2f81c227fa2d4fe76b818ecee44bc09'
            '841e5d804166ff2965a917fc937ea5a6e0e4407432931a1a1daa7f37a42d08b4'
            '21e15f6a5f65e360816e4c7183fdef919f6194a05a6b5b1afa09a0f9cce2982c'
            '0576761a39c1686e81a61cb53f9a3cec409507fe75a29baf689cf7d0bc3b3f91'
            '2cf30c9dacf2de9ace8ef86fc5de0dbf575c594506bf535834955ec7b0e1170e'
            '822523df717a59824c2133769df6aed2f55955afcc265f2bfca52de5dc83d06b'
            'bc6d207625c88e0336d9f241640be37cd6dfee5c38cb2b75353cd2f0ddaa3d77'
            '4ffd83abf4475dfcf7c58be777e3e291673c3fce668ba1410dc9c055a7056414'
            '653d35e240126923fcf1c34bfe38f6c4a0668adac6766064831340b9c432c80e'
            'ba4fa90491bf7dd47157620a6e4f9279ff453a8c932b50e97402cd2ee63aaa9a'
            '6844f409636b9b57df26cb85b4e255ba89cef308d4b10ad7af45e002fa728aff'
            'd91e0f29b671b05680a600121ff1f3cd3bac416e0768107f33109ebe60a2d761'
            'b9856f235b4ca41511f90ad300c22a28fe89a9382cce1c663e791feee919bc49'
            '8719eb6a2422a82f71e0e1f2343baf0926479ab16f2052ea0b14aba51eb1311d'
            'a0e5f139c10de56161ffda9868cdece666542c3db1dd46c410e3c08c3d8667ed'
            '63f4f69c4a215c4f9ef977277cf8fd0d31908f0b77246a121880031761b71145'
            '382077a3cd3cfa2464e841860c93049f10f184ec93a8d57318d32d169863f662'
            'fdb3d4c85b4b639bb3ba4a53e86955efd7d36477e99350d20313813f851132cc'
            'e60c24d1be89b480da7601ea1aee63a6d8e40f47b32ce094c075d630fd14fbfd'
            '0fbb39328eddfa0a4df64cf8c0286b5c1f729bbdf715dcc7ded543c5f5abe9e2'
            '7335c4c5174a3d56efe36aeb212c2a6a6af4d9de9dc9e73b338f5bff546654d4'
            'b06f72c4f67f6f686d3ea2ba81644fb36b32e8aacaed9ea1449ab0f84f076db0'
            '5f65478935ea11159aa88d5afcd312180e5e0c10f921e12bc850ceae06e3d1ac'
            'e49e83f27a396b47789f66c4409a97cd84b0209f739c3d5dadc4a5ffa32b2b79'
            '7ca3a5d5d408a093ca81bdf808a3366e8435b9d27a3a5b572d3d08f7b4a2628f'
            '138f23dcdf807c5becd143c5898abfc040ea1a56fe09d6eee7656fea400ade40'
            'b319b2826482950d32eaa937ce4aeef2db9d20be09f135ca9b0fe9f1d6de78db'
            '7d2e988f99127b71270a2f7b601154b55eff6e57711c131a14cf4bf4a6d0d2aa'
            '66669aa843c20b62a3de04ad1e50f3ce9190e974ba550bda354afcf8486547e9'
            '32265ba635835f32bab3d587c25a3d1b4872b1e8640aa3012b6084c7b66587f6'
            '1fd9029cd0177ced846e2cfd8e465887074a9b76ddfa56ef98e0756f1f803a62'
            '6e97dc33a8e67744939d37733e2f83c148a9872075dbfc9832c63c62577aac41'
            'e6de5195fc0d10606c3810e9b43a565b921f03fba7cc24d82d9678c4465825bd'
            '22e769acca6d7323f7cb16f91c5292b61a4c6025f487f0bead197e269dac5cce'
            '48be2c260c2a6222068fe01bbb3e5102060d3244a1d496ddc2e14b42ff7fed39'
            'e1d6105de25052ef92099df47e119f8cd8894563251d6e3a5d344b6b46fe2b4f'
            '3c1c992e4dc491ac7489f8104d9ca780df3e532e2ee9660e34f56981266bea48'
            '63ec3704283b6240beb067621836a8bf3650c3c09df1f6c9f4388a9af9af6c17'
            '504f28a68f23a84473fad2992656d548feb5b39a46dcd4c47aa34ceea2d55a66'
            '6036a0aa2419fb4bafe11d088ece41a41799aff8ff3ebf9cd6f7d9897d516494'
            'c601ce6a2c504910f13fcf1da467b7d4a6476340a733bc7aa20012157781a1d2'
            '7dc4d8159092d361622acb21680a89b16f0f7706c7be1ffa6db26f912fb66cc3'
            '00fdcbc23ffc2406f25de44eafb969c5b6727203defdad6b457f41ea3e5fb295'
            'c16de57f68bdb3595c93d496904e4450d5be8845bc327c5aa86715d7d434de19'
            '23ff1a24d6f86fa9be959a3d1b7c5cd2f7385a4e9fd1b985461b846f435a5c8b'
            '5a6a5ce2b1ccad19bb630b2985dc97b444f405e28f34d544df4ec248471f54d8'
            '254fb77448c5636f3d2f0f1080c2d7bd13d375e78f86cde692ee1ef4f76055be'
            '2ef10bcf52649332c19cb9581d2b25e841f3fc6eedd27e8807a7cb173a71972b'
            'f928198d8fef8004f6fe6004e9807541469daad07d2dea614ee270fbe7bdde49'
            'f1ddd555bf48c9b25d74947788aba45139862df5d87dd3dd204ace24160d2500'
            '45f833a28e3f08a32f8be64751561bd1c5eb2e02c216b7ffbeff0b78c99df219'
            '50753ea45a003e694153219e534b39112c04773c479bad135d1baec19b8f897e'
            'd8c5c536f0ba261501d61d1d74c755c122d2c6b5ed2b9b58f33a30ecadc7f6d4'
            '477d28a3a518be7992a05a733d0490b6b2137d911211be774a317fe71147ed91'
            'b7cf1fb8e1aa54431079a0cdf07ef8b572624e02095643b3b48398c7fce1f0c3'
            '5e502499a0b7dea8fd9dbc83f5fe5896ff162743997fb7255cf76244ce1e04c4'
            '9d9f78979970d14aa227c6b6d042d6d1c7c58305486421d0cbb1535409dacd15'
            '234ef71c9ca73ca921746f82a4284da6d9a2087fe320544ee7b10b1da1b27390'
            'aea8bf657ef2ca47b54fd9409b3e19110190ba6b3e28210c887c6a4737652abd'
            '81e0d9c316447b9f8c02a2536a4fd0657657d0bcc69607519435c1c309bda20f'
            'fb5cb5c60e1dba0039abf7e0d3c2fd3a1a78e673f273af22b54c5da6fd3aa349'
            '47053069083a8ec123d47a8c0a545d9dde76874ff973e6c0442602ba1e8d6c10'
            '3bf514f86b265554e38607f901c0a74e12c8cae22bffff69d3b1a507ed50b00f'
            '1bd6bd75107dab745c3ac191d16280d657bea0e7361d57382dec0e9cdb12bb33'
            '63f53e47f67032dfe3be7c3cc84b3db1cde83c28c220ab5b2b3284b837466f45'
            '88936d97ab5668d5966a1e29c4e39c3cc34553d449756446dee8bf9ece9b3b50'
            '7bf9a02e06485fc92e4a241ddcaf84aeb8ded96446a7a892ea517ec9ae40e101'
            '22436cb26cf7fd3a6d1b9eaf26a6cd7b7da4984e3f3683a2e37cdbbeafa0cbcc'
            '5140afc85e3b82462da3a4ce66db7e7ab6d49f10a079409bf46adacc95fab6bb'
            '00b9b3b7ad3c7d7d853b513d9d1bd85fc1f67abc7cb5437c984569ff63e604f5'
            '028844770ba7dd04e96d4c891312f813b41099f11e8c714a488bbb1265fc55ff'
            '2190c2475244729db2d4f73d29f14076963ad4387a1c8e4c367d8397f9fae3bf'
            '89f33e9093844061b46d8559e1ebdf45dbcc1d6dbf8c348dd4888e3243acc28a'
            '48893a81dee763a318c556ac681a2befcbf641c7d96dc908dcb044742311fc64'
            'cb4ccb26bd33d0ba3978681849cbd80f40ba4e03edf5ae8262dc8d00e7b7f1e1'
            '6c6f6e2480cf1d7887a8ee8d8a9e32ec25e57d6f164123412d1b78e3ac8a2770'
            'de1f9986ae727efc71da3ab6a4a4ca2485e3c648c0329af4d426ca92d7ef403c'
            '64906ad560ae07950002bac162c6eb09a8fa5d15f27905755f3daa2fdeed133b'
            '86be217918de6a7a5b82d07f9dd98240b2647ea252f4b0f9c2cde18f55152eb7'
            '7c095fec358c91269dc5795a4653d75dd417749614ba3c5384f5917412f22348'
            'f84522a07c9fdff804a06db1e4213f007a93270d5bd2f3e42b40328e9eeb6e0c'
            'e8536d5795757047ad9ab4ce29f6a70a10c515de6c5b88c21fd4c607b97f91a5'
            'a3789ae2e6702a60b61b57cff4bb82a1887a7f6d1b111796d359617b5ff4a98b'
            '856ace10e4047911ddf23d9330fdb7dba5c3cf02d96ab38eca69040eb9167aae'
            '7b1ef2a4fa7757d648934162e17706c1894d2cb017e1464d10218a45d03edd96'
            '62c945f02bf6ae68d36a68f89cff04b427607728b9e82ba1352f06dbb97791af'
            'c1ba46af5ef2b01df8bb7746504c52b896d2cd8a34870c89e9e90e6998114f32'
            '493a78a496e249265f81a9bcbd13855fe5a2a0f08109a672b4cc1e82d7b0bf85'
            '68ce6de61cdaee1d5183050ffb9425d18b66d3d16222e19d6ccbb5b3c89f3147'
            'f08f68c08a7f80fbec93fe2a6dc127500977b64942e72efae7988e0c632c17d3'
            'a948e964a280cb8d23634ac9304aac70975acbb6774b2ee989030bd6679c8fd7'
            '470473b320c2025555dceae7daea406409382d4638f2d84f2f0e666822b899c2'
            'c528fb572c4f015e4ca82c20ad0f8795f148ab9b24c86041e1f11206f83a3097'
            'c262d398cdcd1da4479c3cc56c4b316274d1c1a98bd1e5a78db53f21b5ef0cb0'
            'c3d152ca4d903e2e5dad5f3b1a3aa07b3f5f510fc929c3b75dd455253594cf98')

package_openwrt-toolchain-apm821xx-nand() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-apm821xx-nand_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-apm821xx-sata() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-apm821xx-sata_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-armsr-armv7() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-armsr-armv7_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-armsr-armv8() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-armsr-armv8_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-at91-sam9x() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-at91-sam9x_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-at91-sama5() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-at91-sama5_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-at91-sama7() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-at91-sama7_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ath79-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ath79-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ath79-mikrotik() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ath79-mikrotik_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ath79-nand() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ath79-nand_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ath79-tiny() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ath79-tiny_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm27xx-bcm2708() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm27xx-bcm2708_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm27xx-bcm2709() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm27xx-bcm2709_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm27xx-bcm2710() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm27xx-bcm2710_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm27xx-bcm2711() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm27xx-bcm2711_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm27xx-bcm2712() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm27xx-bcm2712_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm47xx-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm47xx-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm47xx-legacy() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm47xx-legacy_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm47xx-mips74k() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm47xx-mips74k_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm4908-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm4908-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bcm53xx-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bcm53xx-generic_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bmips-bcm6318() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bmips-bcm6318_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bmips-bcm63268() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bmips-bcm63268_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bmips-bcm6328() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bmips-bcm6328_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bmips-bcm6358() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bmips-bcm6358_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bmips-bcm6362() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bmips-bcm6362_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bmips-bcm6368() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-bmips-bcm6368_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-d1-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-d1-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-gemini-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-gemini-generic_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-imx-cortexa53() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-imx-cortexa53_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-imx-cortexa7() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-imx-cortexa7_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-imx-cortexa9() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-imx-cortexa9_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ipq40xx-chromium() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ipq40xx-chromium_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ipq40xx-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ipq40xx-generic_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ipq40xx-mikrotik() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ipq40xx-mikrotik_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ipq806x-chromium() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ipq806x-chromium_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ipq806x-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ipq806x-generic_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ixp4xx-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ixp4xx-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-kirkwood-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-kirkwood-generic_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-lantiq-ase() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-lantiq-ase_gcc-14.2.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-lantiq-xrx200() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-lantiq-xrx200_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-lantiq-xrx200_legacy() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-lantiq-xrx200_legacy_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-lantiq-xway() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-lantiq-xway_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-lantiq-xway_legacy() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-lantiq-xway_legacy_gcc-14.2.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-layerscape-armv7() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-layerscape-armv7_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-layerscape-armv8_64b() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-layerscape-armv8_64b_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-loongarch64-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-loongarch64-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-malta-be() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-malta-be_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-malta-be64() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-malta-be64_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-malta-le() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-malta-le_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-malta-le64() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-malta-le64_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mediatek-filogic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mediatek-filogic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mediatek-mt7622() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mediatek-mt7622_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mediatek-mt7623() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mediatek-mt7623_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mediatek-mt7629() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mediatek-mt7629_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mpc85xx-p1010() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mpc85xx-p1010_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mpc85xx-p1020() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mpc85xx-p1020_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mpc85xx-p2020() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mpc85xx-p2020_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mvebu-cortexa53() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mvebu-cortexa53_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mvebu-cortexa72() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mvebu-cortexa72_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mvebu-cortexa9() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mvebu-cortexa9_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-mxs-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-mxs-generic_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-octeon-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-octeon-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-omap-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-omap-generic_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-pistachio-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-pistachio-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-qoriq-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-qoriq-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-qualcommax-ipq50xx() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-qualcommax-ipq50xx_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-qualcommax-ipq60xx() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-qualcommax-ipq60xx_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-qualcommax-ipq807x() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-qualcommax-ipq807x_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ramips-mt7620() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ramips-mt7620_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ramips-mt7621() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ramips-mt7621_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ramips-mt76x8() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ramips-mt76x8_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ramips-rt288x() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ramips-rt288x_gcc-14.2.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ramips-rt305x() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ramips-rt305x_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-ramips-rt3883() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-ramips-rt3883_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-realtek-rtl838x() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-realtek-rtl838x_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-realtek-rtl839x() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-realtek-rtl839x_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-realtek-rtl930x() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-realtek-rtl930x_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-realtek-rtl930x_nand() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-realtek-rtl930x_nand_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-realtek-rtl931x() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-realtek-rtl931x_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-realtek-rtl931x_nand() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-realtek-rtl931x_nand_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-rockchip-armv8() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-rockchip-armv8_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-sifiveu-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-sifiveu-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-siflower-sf21() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-siflower-sf21_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-starfive-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-starfive-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-stm32-stm32mp1() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-stm32-stm32mp1_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-sunxi-arm926ejs() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-sunxi-arm926ejs_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-sunxi-cortexa53() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-sunxi-cortexa53_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-sunxi-cortexa7() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-sunxi-cortexa7_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-sunxi-cortexa8() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-sunxi-cortexa8_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-tegra-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-tegra-generic_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-zynq-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-zynq-generic_gcc-14.3.0_musl_eabi.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-x86-64() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-x86-64_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-x86-generic() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-x86-generic_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-x86-geode() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-x86-geode_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-x86-legacy() {
  mkdir -p "$pkgdir/$_target"

  local src="$srcdir/openwrt-toolchain-x86-legacy_gcc-14.3.0_musl.Linux-x86_64"

  local tdir
  tdir="$(find "$src" -maxdepth 1 -type d -name 'toolchain-*' | head -n 1)"
  cp -a "$tdir" "$pkgdir/$_target"
}

package_openwrt-toolchain-bin() {
  pkgdesc='Helper script to convert a .config to use external toolchains'
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/openwrt-toolchain"

  install -m644 "$srcdir/map" "$pkgdir/usr/share/openwrt-toolchain/map"
  install -m755 "$srcdir/externalize_openwrt_toolchain.sh" \
    "$pkgdir/usr/bin/externalize_openwrt_toolchain"
}
