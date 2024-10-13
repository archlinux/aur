# Program under test
PROG        ?= test.pl
# Default goal to run
MAIN        ?= test

DOCKER_TAG  := prolog-testbed

# All supported Prolog implementations (keep alphabetic order!)
PROLOGS     := ciao gnu scryer swi trealla

.PHONY: $(PROLOGS) all
all: $(PROLOGS)

# Most prologs listed here don't currently work in Docker, add them to $(PROLOGS) when packaged and tested
b: $(PROG)
	/opt/BProlog/8.1/bp -i $< -g '$(MAIN),halt'
bin: $(PROG)
	bp "consult('$<'),$(MAIN),halt"
ciao: $(PROG)
	ciao run $<
doge: doge-js doge-py doge-java
doge-js: doge.pl
	node /usr/local/git/dogelog/player/canned/dogelog.mjs $<
doge-py: doge.pl
	python /usr/local/git/dogelog/playerpy/canned/dogelog.py $<
doge-java: doge.pl
	java -cp /usr/local/git/dogelog/playerj/canned/dogelog.zip:playerj/canned Index $<
doge.pl: $(PROG) Makefile
	$(file >$@,false :- \+true. ?- ['$<'],$(MAIN).)
eclipse: $(PROG)
	eclipse-clp -e "['$<'],$(MAIN)"
gnu: $(PROG)
	env TRAILSZ=999999 GLOBALSZ=999999 gprolog --consult-file $< --query-goal '$(MAIN),halt'
pop: $(PROG)
	poplog prolog ":prolog_callstack_lim(10000000),prolog_memlim(10000000),prolog_area_lim(10000000),library(catch),assert(poplog),['$<'],$(MAIN)."
projog: $(PROG)
	java -cp '/usr/local/opt/projog-0.10.0/lib/*' org.projog.tools.ProjogConsole $< <(echo '?- $(MAIN).') <(echo '?- quit.')
scryer: $(PROG)
	scryer-prolog $< -g '$(MAIN),halt'
sicstus: $(PROG)
	/opt/SICStus/bin/sicstus -l $< --goal '$(MAIN),halt.'
swi: $(PROG)
	swipl -l $< -g '$(MAIN),halt'
tau: tau.js package.json
	node $< ./$(PROG) $(MAIN).
trealla: $(PROG)
	tpl $< -g '$(MAIN),halt'
tu: $(PROG)
	java -jar /opt/tuprolog/2p-repl-0.20.0-redist.jar -T $< solve $(MAIN)
xsb: $(PROG)
	/usr/local/src/xsb-prolog/XSB/bin/xsb -e "use_module(lists,length/2),['$<'],$(MAIN),halt."
yap: $(PROG)
	yap -l $(PROG) -z $(MAIN)
