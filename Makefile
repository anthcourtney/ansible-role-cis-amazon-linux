ANSIBLE_TEST_PLAYBOOK_FILE = playbook.yml
ANSIBLE_CONTAINER_PLAYBOOK_FILE = container.yml

symlink-role:
	@mkdir -p tests/roles 
	@rsync -a . tests/roles/ansible-role-cis-amazon-linux --exclude 'tests/' --exclude '.git'

test: symlink-role syntax test-ansible-2.4.5 test-ansible-2.5.5

test-ansible-2.0.2:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.0.2"

test-ansible-2.1.3:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.1.3"

test-ansible-2.2:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.2"

test-ansible-2.3.3:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.3.3"
	
test-ansible-2.4.5:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.4.5"
	
test-ansible-2.5.5:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.5.5"
	
test-ansible-2.6:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.6"

syntax:
	cd tests && ansible-playbook --syntax-check -i localhost, $(ANSIBLE_TEST_PLAYBOOK_FILE)

review:
	git ls-files | xargs ansible-review -c tests/ansible-review/config.ini
