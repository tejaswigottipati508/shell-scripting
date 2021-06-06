help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
common:
	@sh components/common.sh

cart: common ## Install Cart Component
	@echo does something

catalogue: common ## This message will show up too!!!
	@echo does something
