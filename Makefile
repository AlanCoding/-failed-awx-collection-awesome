COLLECTION_PACKAGE ?= awx_awesome
COLLECTION_NAMESPACE ?= alancoding
VERSION ?= 0.0.1

clone:
	ansible-playbook -i localhost, awx_clone.yml -e collection_package=$(COLLECTION_PACKAGE) -e collection_namespace=$(COLLECTION_NAMESPACE) -e collection_version=$(VERSION)

install_cli:
	pip install --target=awx/awx_collection/plugins/module_utils ansible-tower-cli

rm_pyc:
	find awx/awx_collection -type f -regex ".*\.py[co]$$" -delete
	find awx/awx_collection -type d -name "__pycache__" -delete

build:
	ansible-galaxy collection build awx/awx_collection --output-path=.

install_collection:
	ansible-galaxy collection install alancoding-awx_awesome-0.0.1.tar.gz

test:
	ansible-playbook -i localhost, test.yml -e collection_id=alancoding.awx_awesome -vvvv

clean:
	rm -rf awx
	rm -rf *.tar.gz
	rm -rf ~/.ansible/collections/ansible_collections/alancoding/awx_awesome

awesome: clean clone install_cli build install_collection
