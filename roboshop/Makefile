help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

common:
	@sh components/common.sh

cart: common
cart:         ##Install Cart Component
	@sh components/cart.sh

frontend: common
frontend:    ##Install Frontend Component
	@sh components/frontend.sh

mongodb: common
mongodb:    ##Install Frontend Component
	@sh components/mongodb.sh

catalogue: common
catalogue:    ##Install Catalogue Component
	@sh components/catalogue.sh

redis: common
redis:    ##Install Frontend Component
	@sh components/redis.sh

user: common
user:    ##Install Frontend Component
	@sh components/user.sh

mysql: common
mysql:    ##Install Frontend Component
	@sh components/mysql.sh
