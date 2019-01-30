# Makefile for the Husky build environment

# include Husky-Makefile-Config
ifeq ($(DEBIAN), 1)
# Every Debian-Source-Paket has one included.
include /usr/share/husky/huskymak.cfg
else ifdef RPM_BUILD_ROOT
# RPM build requires all files to be in the source directory
include huskymak.cfg
else
include ../huskymak.cfg
endif

ifeq ($(OSTYPE), UNIX)
  LIBPREFIX=lib
  DLLPREFIX=lib
endif

include make/makefile.inc

ifeq ($(DEBUG), 1)
  CFLAGS=$(WARNFLAGS) $(DEBCFLAGS)
  LFLAGS=$(DEBLFLAGS)
else
  CFLAGS=$(WARNFLAGS) $(OPTCFLAGS)
  LFLAGS=$(OPTLFLAGS)
endif

SRC_DIR = src/
H_DIR   = smapi

CDEFS=-D$(OSTYPE) $(ADDCDEFS) -I$(H_DIR) -I$(INCDIR)
LIBS=-lhusky

ifeq ($(DYNLIBS), 1)
all: $(TARGETLIB) $(TARGETDLL).$(VER)
else
all: $(TARGETLIB)
endif


%$(_OBJ): $(SRC_DIR)%.c
	$(CC) $(CFLAGS) $(CDEFS) $(SRC_DIR)$*.c

$(TARGETLIB): $(OBJS)
	$(AR) $(AR_R) $(TARGETLIB) $?
ifdef RANLIB
	$(RANLIB) $(TARGETLIB)
endif                                                             

ifeq ($(DYNLIBS), 1)
  ifeq (~$(MKSHARED)~,~ld~)
$(TARGETDLL).$(VER): $(OBJS)
	$(LD) $(LFLAGS) -o $(TARGETDLL).$(VER) $(OBJS) -L$(LIBDIR) $(LIBS)
  else
$(TARGETDLL).$(VER): $(OBJS)
	$(CC) $(LFLAGS) -shared -Wl,-soname,$(TARGETDLL).$(VERH) \
          -o $(TARGETDLL).$(VER) $(OBJS) -L$(LIBDIR) $(LIBS)
  endif

instdyn: $(TARGETLIB) $(TARGETDLL).$(VER)
	-$(MKDIR) $(MKDIROPT) $(DESTDIR)$(DIRSEP)$(LIBDIR)
	$(INSTALL) $(ILOPT) $(TARGETDLL).$(VER) $(DESTDIR)$(DIRSEP)$(LIBDIR)
	-$(RM) $(RMOPT) $(DESTDIR)$(DIRSEP)$(LIBDIR)$(DIRSEP)$(TARGETDLL).$(VERH)
	-$(RM) $(RMOPT) $(DESTDIR)$(DIRSEP)$(LIBDIR)$(DIRSEP)$(TARGETDLL)
# Changed the symlinks from symlinks with full path to just symlinks.
# Better so :)
	cd $(DESTDIR)$(DIRSEP)$(LIBDIR) ;\
	$(LN) $(LNOPT) $(TARGETDLL).$(VER) $(TARGETDLL).$(VERH) ;\
	$(LN) $(LNOPT) $(TARGETDLL).$(VER) $(TARGETDLL)
ifneq (~$(LDCONFIG)~, ~~)
	$(LDCONFIG)
endif

else
instdyn: $(TARGETLIB)

endif

FORCE:

install-h-dir: FORCE
	-$(MKDIR) $(MKDIROPT) $(DESTDIR)$(DIRSEP)$(INCDIR)$(DIRSEP)$(H_DIR)

%.h: FORCE
	-$(INSTALL) $(IIOPT) $(H_DIR)$(DIRSEP)$@ $(DESTDIR)$(DIRSEP)$(INCDIR)$(DIRSEP)$(H_DIR)
        
install-h: install-h-dir $(HEADERS)

install: install-h instdyn
	-$(MKDIR) $(MKDIROPT) $(DESTDIR)$(DIRSEP)$(LIBDIR)
	$(INSTALL) $(ISLOPT) $(TARGETLIB) $(DESTDIR)$(DIRSEP)$(LIBDIR)

uninstall:
	-cd $(DESTDIR)$(DIRSEP)$(INCDIR)$(DIRSEP)$(H_DIR) ;\
	$(RM) $(RMOPT) $(HEADERS)
	-$(RM) $(RMOPT) $(DESTDIR)$(DIRSEP)$(LIBDIR)$(DIRSEP)$(TARGETLIB)
	-$(RM) $(RMOPT) $(DESTDIR)$(DIRSEP)$(LIBDIR)$(DIRSEP)$(TARGETDLL)*

clean:
	-$(RM) $(RMOPT) *$(_OBJ)

distclean: clean
	-$(RM) $(RMOPT) $(TARGETLIB)
	-$(RM) $(RMOPT) $(TARGETDLL).$(VER)
