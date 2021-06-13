help:
	@printf "\033[32mRoboshop Shell Scripting v$(version)\033[0m\n\n"
    @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
common:
	@sudo sh components/common.sh
cart: common
	@sudo sh components/cart.sh
catalogue: common
	@sudo sh components/catalogue.sh
frontend: common
	@sudo sh components/frontend.sh

