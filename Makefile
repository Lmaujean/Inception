PATH_YML = docker-compose.yml
RED = "\033[1;31m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"

ifneq (,$(wildcard tools/data_path.txt))
	path_file := tools/data_path.txt
	variable := $(shell cat ${path_file})
	wordpress_path := $(shell echo ${variable}/wordpress)
	mariadb_path := $(shell echo ${variable}/mariadb)
endif


all:
ifeq (,$(wildcard tools/data_path.txt))
	@bash tools/config.sh
	@echo "Good!"
	@echo "Use make to launch"
else
ifeq (,$(wildcard $(mariadb_path)))
	@sudo mkdir -p $(mariadb_path)
	@sudo mkdir -p $(wordpress_path)
	@sudo chmod 777 $(mariadb_path)
	@sudo chmod 777 $(wordpress_path)
endif
	@echo "Starting Inception..."
	@sleep 1
	@sudo docker-compose -f $(PATH_YML) up -d --build
endif

re: clean all

stop:
	@sudo docker-compose -f $(PATH_YML) stop


clean: stop
	@sudo docker-compose -f $(PATH_YML) down -v

reset: clean
	@rm tools/data_path.txt
	@printf "\nPath is reset\n"

config:
	@bash tools/config.sh