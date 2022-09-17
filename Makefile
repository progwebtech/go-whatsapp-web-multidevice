VERSION := v0.0.3
NAME := whatsapp
#$(shell echo $${PWD\#\#*/})
TARGET := ./$(NAME)_linux
all: clean build image tag push
image:
	@docker build -t $(NAME):$(VERSION)  -f ./docker/golang.Dockerfile .
tag:
	@docker tag $(NAME):$(VERSION) rg.fr-par.scw.cloud/dostow/$(NAME):$(VERSION)
push:
	@docker push rg.fr-par.scw.cloud/dostow/$(NAME):$(VERSION)
clean:
	@rm -f $(TARGET)
