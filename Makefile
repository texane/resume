##
## Makefile for  in /home/texane/repo/adm/resume
## 
## Made by fabien le mentec <texane@gmail.com>
## 
## Started on  Fri Sep 18 15:42:37 2009 fabien le mentec
## Last update Tue Feb 15 19:07:23 2011 fabien le mentec
##


export BASEDIR := $(shell pwd)
export COMMONDIR := $(BASEDIR)/common
export OUTPUTDIR := $(BASEDIR)/output


.PHONY: all clean


all:
	( cd en && make all )
	( cd fr && make all )
	( cd phd && make all )

clean:
	( cd en && make clean )
	( cd fr && make clean )
	( cd phd && make clean )
