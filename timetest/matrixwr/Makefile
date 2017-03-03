
#=====================User define area===================
input1=timetest3d2.f90 
output1=a.out
#========================================================

FC = ifort -r8 -O



OBJECT1 := $(input1:.f90=.o)


$(output1) : $(OBJECT1)
	$(FC) -o $@ $^ $(LIBS)
	rm -f *.o *.mod 

$(output2) : $(OBJECT2)
	$(FC) -o $@ $^ $(LIBS) 
	rm -f *.o *.mod 

%.o: %.f90
	$(FC) -c $< $(MMOD)
clean:
	rm -f *.o *.mod *.x	
