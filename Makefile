#Inspired from : https://github.com/littlemanco/boilr-makefile/blob/master/template/Makefile, https://github.com/geetarista/go-boilerplate/blob/master/Makefile, https://github.com/nascii/go-boilerplate/blob/master/GNUmakefile https://github.com/cloudflare/hellogopher/blob/master/Makefile
PWD=$(shell pwd)
ERROR_COLOR=\033[31;01m
NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
WARN_COLOR=\033[33;01m

all: prometheus-all alertmanager-all node-exporter-all

prometheus-all:
	@echo -e "$(OK_COLOR)==> Docker build/push image : prometheus $(NO_COLOR)"
	cd $(PWD)/prometheus ;	make all

alertmanager-all:
	@echo -e "$(OK_COLOR)==> build/push plugin : alertmanager$(NO_COLOR)"
	cd $(PWD)/alertmanager;	make all

node-exporter-all:
	@echo -e "$(OK_COLOR)==> build/push plugin : alertmanager$(NO_COLOR)"
	cd $(PWD)/node-exporter;	make all
