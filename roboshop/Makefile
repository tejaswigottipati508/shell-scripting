help:
	@printf "\033[32mRoboShop Shell Scripting Make Options$(version)\033[0m\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

common:
	@sh components/common.sh

cart: common
cart:        ##Install Cart Component
	@sh components/cart.sh
PHONY: frontend
frontend: common
frontend:       ##Install Frontend Component
	@sh components/frontend.sh
