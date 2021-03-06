################################################################
# Makefile for preparing/moving/installing the binary distribution of
# SWI-Prolog and/or XPCE
#
# Author: Jan Wielemaker
# E-mail: J.Wielemaker@cs.vu.nl
#
# Targets
#	make		(Re)makes SWI-Prolog startup file and XPCE
#			precompiled Prolog files (QLF-files).
#	make clean	Remove XPCE QLF-files.  All should work
#			without them.  Without QLF files loading
#			is slower but development is better and
#			relocating the system is more robust.
################################################################

MAKE=make
SWIPL=swipl
PLWINARG=-F swipl-win
PL=bin/i386-win32/$(PLWINNAME)
PLARCH=i386-win32
INSTALL_PLARCH=
EXEEXT=.exe

BPL=		bin/$(INSTALL_PLARCH)/$(SWIPL)$(EXEEXT) $(PLWINARG)
PWD=`pwd`

# Make this boot64 for 64-bit processors

STARTUP=	boot32.prc
BOOTPLS=	boot/apply.pl boot/autoload.pl \
		boot/bags.pl boot/dwim.pl \
		boot/history.pl boot/init.pl \
		boot/load.pl boot/parms.pl \
		boot/qlf.pl boot/syspred.pl boot/toplevel.pl \
		boot/topvars.pl boot/predopts.pl

all:		$(STARTUP) xpce-qlfs

$(STARTUP):	$(BOOTPLS)
		$(BPL) -f none -O -o $@ -b boot/init.pl

xpce-qlfs:
		@PLBASE=$(PWD); \
		if [ -d xpce ]; then \
		   echo $(MAKE) PL="$$PLBASE/$(BPL)"; \
                   (cd xpce/prolog/lib; $(MAKE) PL="$$PLBASE/$(BPL)"); \
		fi

clean:
		rm -f `find xpce/prolog -name '*.qlf' -print`
