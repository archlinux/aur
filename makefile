CC = gcc
CFLAGS = -O2 -fomit-frame-pointer -ffast-math -funroll-loops -Wall -Ijoynet/enet-1.2/include -DT3F_COMPANY="\"t3-i\"" -DT3F_PACKAGE_NAME="\"paintball-party-2\""
RELEASE_LIBS = -lallegro_image -lallegro_font -lallegro_primitives -lallegro_audio -lallegro_acodec -lallegro_dialog -lallegro_memfile -lallegro -lcurl -lmxml -lm
LIBS = $(RELEASE_LIBS)

include makefile.common

JOYNET_PLATFORM_OFILES = joynet/enet-1.2/unix.o
PP2_EXENAME = ../bin/pp2
LEVEDIT_EXENAME = ../bin/levedit
CHAREDIT_EXENAME = ../bin/charedit

all : $(PP2_EXENAME) $(LEVEDIT_EXENAME) $(CHAREDIT_EXENAME)

$(PP2_EXENAME) : $(T3F_OFILES) $(JOYNET_OFILES) $(JOYNET_PLATFORM_OFILES) $(T3NET_OFILES) $(PP2_OFILES)
	gcc $(T3F_OFILES) $(JOYNET_OFILES) $(JOYNET_PLATFORM_OFILES) $(T3NET_OFILES) $(PP2_OFILES)  $(LIBS) -o $(PP2_EXENAME)

$(LEVEDIT_EXENAME) : $(T3F_OFILES) $(LEVEDIT_OFILES)
	gcc $(T3F_OFILES) $(LEVEDIT_OFILES) $(LIBS) -o $(LEVEDIT_EXENAME)

$(CHAREDIT_EXENAME) : $(T3F_OFILES) $(CHAREDIT_OFILES)
	gcc $(T3F_OFILES) $(CHAREDIT_OFILES) $(LIBS) -o $(CHAREDIT_EXENAME)

clean:
	@rm -f *.o
	@rm -f file/*.o
	@rm -f file/database/*.o
	@rm -f legacy/*.o
	@rm -f interface/*.o
	@rm -f gameplay/*.o
	@rm -f gameplay/sprites/*.o
	@rm -f network/*.o
	@rm -f misc/*.o
	@rm -f t3f/*.o
	@rm -f t3net/*.o
	@rm -f joynet/*.o
	@rm -f joynet/enet-1.2/*.o
	@echo Cleanup complete!
