GENERATES = $(wildcard */generate.yaml)
DOCKERFILES = $(wildcard */Dockerfile)

all: generate

# generate conf files
generate: $(GENERATES)
	ansible-playbook $<

# check if generated files match what they should be.
check: $(GENERATES)
	ansible-playbook $< --check

# create deploy tar by building docker image
# make SERVICE=<directory of service> STAGE=<stage> image
image:
	docker load -i $(SERVICE).tar
	docker build -t $(subst -,/,$(SERVICE)):neu -f $(SERVICE)/Dockerfile --build-arg stage=${STAGE} $(SERVICE)/
	docker save -o $(SERVICE)-deploy.tar $(subst -,/,$(SERVICE)):neu
