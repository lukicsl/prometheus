#Inspired from : https://github.com/littlemanco/boilr-makefile/blob/master/template/Makefile, https://github.com/geetarista/go-boilerplate/blob/master/Makefile, https://github.com/nascii/go-boilerplate/blob/master/GNUmakefile https://github.com/cloudflare/hellogopher/blob/master/Makefile
PWD=$(shell pwd)

all: prometheus alertmanager

prometheus:
	@echo -e "$(OK_COLOR)==> Docker build/push image : prometheus $(NO_COLOR)"
  cd $(PWD)/prometheus
	make all

alertmanager:
	@echo -e "$(OK_COLOR)==> build/push plugin : alertmanager$(NO_COLOR)"
  cd $(PWD)/alertmanager
	make all
