ANSIBLE_TEST_PLAYBOOK_FILE = playbook.yml

syntax:
	cd tests && ansible-playbook --syntax-check -i localhost, $(ANSIBLE_TEST_PLAYBOOK_FILE)
