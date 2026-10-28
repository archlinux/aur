obj-m += btusb.o btmtk.o

# Optional local package identity, generated during source preparation.
ifneq ($(wildcard $(src)/bt-local-version.h),)
ccflags-y += -include $(src)/bt-local-version.h
endif
