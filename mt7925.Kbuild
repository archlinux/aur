obj-m += mt7925-common.o
obj-m += mt7925e.o

mt7925-common-y := mac.o mcu.o regd.o main.o init.o debugfs.o
mt7925-common-$(CONFIG_NL80211_TESTMODE) += testmode.o
mt7925e-y := pci.o pci_mac.o pci_mcu.o
