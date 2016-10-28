
FC = gfortran
FFLAGS = -O0
LDFLAGS = -lX11 -lfeappv
FINCLUDE = -I/usr/include/feappv -I/usr/include/feappv/integer8

OBJ = example.o
FEAP = feap

$(FEAP): $(OBJ)
	$(FC) -o $(FEAP) $(OBJ) $(LDFLAGS)

.f.o:
	$(FC) -c $(FFLAGS) $(FINCLUDE) $*.f -o $*.o

clean:
	rm -f $(OBJ) $(FEAP)

.PHONY: clean
