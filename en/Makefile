##
## Makefile<4> for  in /home/texane/repo/adm/resume/fr
## 
## Made by fabien le mentec <texane@gmail.com>
## 
## Started on  Fri Sep 18 15:41:49 2009 fabien le mentec
## Last update Fri Sep 18 15:58:16 2009 fabien le mentec
##


include $(COMMONDIR)/Makefile.rules


all: $(OUTPUTDIR)/resume_fabien_lementec.pdf

$(OUTPUTDIR)/resume_fabien_lementec.pdf: resume.dvi
	dvipdf resume.dvi $@

$(OUTPUTDIR)/resume_fabien_lementec.txt: resume.dvi
	catdvi resume.dvi > $@
