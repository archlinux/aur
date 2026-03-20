obj-m += mt76.o
obj-m += mt76-connac-lib.o
obj-m += mt792x-lib.o
obj-m += mt7921/
obj-m += mt7925/

mt76-y := \
	mmio.o util.o trace.o dma.o mac80211.o debugfs.o eeprom.o \
	tx.o agg-rx.o mcu.o wed.o scan.o channel.o pci.o

mt76-connac-lib-y := mt76_connac_mcu.o mt76_connac_mac.o mt76_connac3_mac.o

mt792x-lib-y := mt792x_core.o mt792x_mac.o mt792x_trace.o \
		mt792x_debugfs.o mt792x_dma.o mt792x_acpi_sar.o

# Use compat stub for airoha_offload.h on kernels < 6.19
subdir-ccflags-y += $(if $(wildcard $(srctree)/include/linux/soc/airoha/airoha_offload.h),,-I$(src)/compat/include)

CFLAGS_trace.o := -I$(src)
CFLAGS_mt792x_trace.o := -I$(src)
