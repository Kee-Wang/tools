#=====================Info=================


#=====================User define area===================
input1=  cw2_v3b.f90 get_cw2_v3b.f90
input2= cw2_v3b.f90 get_cw20_v3b.f90
output1= cw2_v3b.molpro
output2= cw20_v3b.molpro
#========================================================

FC = ifort -r8

path1 = /home/kee/pes-lib/mods
path2 = /home/kee/pes-lib/libs/mbpol/lib
path3 = /home/kee/pes-lib/pes-co2h2o-sr
path4 = /home/kee/pes-lib/pes-co2h2o-lr
path5 = /home/kee/pes-lib/pes-co2h2o-2b
path6 = /home/kee/pes-lib/pes-co2-huang
path7 = /home/kee/pes-lib/vnbpes

MODS = -I $(path1) -I $(path7)
LIB =# -L$(path2) -lmbpol $(PES_LIB)

SRC1 := \
$(path1)/constants.o\
$(path7)/pes_tools.o
#$(path7)/pes_user.f90\
$(path7)/pes_types.f90\
$(path7)/pes_shell.f90


#pes_h2.o pes_hh.o shell_h.o \
pes_hw.o bemsa.o pes_hww.o shell_hw.o \
$(path3)/pes_co2h2o_sr.o\
$(path4)/pes_co2h2o_lr.o\
$(path4)/basis.o\
$(path5)/pes_co2h2o_2b.o\
$(path6)/co2_coordinate.f90\
$(path6)/co2potlongrange.f90\
$(path6)/pes_co2_huang.o\
pes_shell.o


OBJECT1 := $(SRC1) $(input1:.f90=.o)
OBJECT2 := $(SRC1) $(input2:.f90=.o)

$(output1) : $(OBJECT1)
	$(FC) $(MODS) -o $@ $^ $(LIB) 

$(output2) : $(OBJECT2)
	$(FC) $(MODS) -o $@ $^ $(LIB) 


%.o : %.f90
	$(FC) -c $(MODS) $(LIB) $<

clean:
	rm -f *.x *.o *.mod

.PHONY: all clean
