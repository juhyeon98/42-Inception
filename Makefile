.PHONY	: build start down start stop clean

build	:
	@docker-compose -f ./srcs/docker-compose.yml build

start	:
	@docker-compose -f ./srcs/docker-compose.yml start

up		:
	@docker-compose -f ./srcs/docker-compose.yml up -d

down	:
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

stop	:
	@docker-compose -f ./srcs/docker-compose.yml stop

clean	:
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*