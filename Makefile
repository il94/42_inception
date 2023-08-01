#==============================================================================#
#                                    COLORS                                    #
#==============================================================================#

PURPLE = \033[35m
GREEN = \033[32m
YELLOW = \033[33m
END = \033[0m

#==============================================================================#
#                                   MAKEFILE                                   #
#==============================================================================#

all: up

up:
	echo "$(YELLOW)Making Inception$(END)"
	mkdir -p /home/ilandols/data/mariadb_data /home/ilandols/data/wordpress_data
	sudo docker-compose -f ./srcs/docker-compose.yml up --build
	echo "$(GREEN)Done$(END)"

upd:
	echo "$(YELLOW)Making Inception in background$(END)"
	mkdir -p /home/ilandols/data/mariadb_data /home/ilandols/data/wordpress_data
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build
	echo "$(GREEN)Done$(END)"

down:
	echo "$(YELLOW)Unmaking Inception$(END)"
	sudo docker-compose -f ./srcs/docker-compose.yml down
	echo "$(GREEN)Done$(END)"

clean: down
	echo "$(PURPLE)Cleaning volumes...$(END)"
	sudo rm -rf /home/ilandols/data/mariadb_data/* /home/ilandols/data/wordpress_data/*
	sudo docker volume rm $$(docker volume ls -q)
	echo "$(GREEN)Done$(END)"

fclean: clean
	echo "$(PURPLE)Cleaning volumes...$(END)"
	docker system prune -af
	echo "$(GREEN)Done$(END)"

re: fclean up

.PHONY: all up upd down clean fclean re
.SILENT: