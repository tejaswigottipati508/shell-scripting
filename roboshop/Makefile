#help:
#	@printf "\033[32mRoboshop Shell Scripting Make Options$(version)\033[0m\n\n"
#    @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
#common:
#	@sudo sh components/common.sh
#cart: common
#	@sudo sh components/cart.sh
#catalogue: common
#	@sudo sh components/catalogue.sh
#frontend: common
#	@sudo sh components/frontend.sh
# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'

help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

# Everything below is an example

target00:       ## This message will show up when typing 'make help'
	@echo does nothing

target01:       ## This message will also show up when typing 'make help'
	@echo does something

# Remember that targets can have multiple entries (if your target specifications are very long, etc.)
target02:       ## This message will show up too!!!
target02: target00 target01
	@echo does even more

