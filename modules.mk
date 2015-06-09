MOD_DIARY = mod_diary

mod_diary.la: ${MOD_DIARY:=.slo}
	$(SH_LINK) -rpath $(libexecdir) -module -avoid-version -lneo_cgi -lneo_utl -lneo_cs -lmarkdown ${MOD_DIARY:=.lo}

DISTCLEAN_TARGETS = modules.mk

shared =  mod_diary.la
