anthcourtney.cis-amazon-linu
=========

This ansible role applies v2.0.0 of the CIS Amazon Linux Benchmark. <https://benchmarks.cisecurity.org/tools2/linux/CIS_Amazon_Linux_Benchmark_v2.0.0.pdf>

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Here Be Dragons!
----------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

An example playbook which uses this role is as follows:

```
---

- hosts: localhost
  connection: local
  gather_facts: true
  become: yes

  roles:
    - anthcourtney.cis-amazon-linux
```

A more advance example, which includes modifications to the default values used, as well as the exclusion of some items in the benchmark which are considered unnecessary for a fictional environment, is as follows:

```
---

- hosts: localhost
  connection: local
  gather_facts: true
  become: yes

  vars:
    cis_level_1_exclusions:
      - 5.4.4
      - 3.4.2
      - 6.2.13   
    cis_pass_max_days: 45
    cis_umask_default: 002
 
  roles:
    - anthcourtney.cis-amazon-linux

```

Note that the use of ```become: yes``` is required as 99% of tasks require privileged access to execute.

Options
-------

Tags (and combinations thereof) can be used to run a particular level of the CIS standard, a section, or an individual recommendation. For example:

* Run only Level 1 tasks

```
ansible-playbook playbook.yml -t level-1
```

* Run only Section 3 tasks

```
ansible-playbook playbook.yml -t section-3
```

* Run tasks 1.3.1 and 2.2.10 only

```
ansible-playbook playbook.yml -t 1.3.1,2.2.10
```

Limitations
-----------

At present, only the Level 1 items of the benchmark are implemented. Level 2 items will be added as time permits.

The following checks have not been implemented:

* 4.2.1.2. The determination of what should be logged and the destination of messsages is environment specific.
* 4.2.2.2. The determination of what should be logged and the destination of messages is environment specific.

License
-------

BSD

Author Information
------------------

This role was developed by [Anth Courtney](https://au.linkedin.com/in/anthcourtney).

All feedback, issues and PRs are encouraged and appreciated.
