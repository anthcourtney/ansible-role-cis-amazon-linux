anthcourtney.cis-amazon-linu
=========

This ansible role applies v2.0.0 of the CIS Amazon Linux Benchmark. <https://benchmarks.cisecurity.org/tools2/linux/CIS_Amazon_Linux_Benchmark_v2.0.0.pdf>

Why Would I Use This Role?
--------------------------

If you are attempting to obtain compliance against an industry-accepted security standard, like PCI DSS, APRA or ISO 27001, then you need to demonstrate that you have applied documented hardening standards against all systems within scope of assessment.

If you are running Amazon Linux, then this role attempts to provide one piece of the solution to the compliance puzzle.

Here Be Dragons!
----------------

If you are considering applying this role to any servers, you should have a basic familiarity with the CIS Benchmark (or other similar benchmarks) and an appreciation for the untoward impact that it may have on a system.

If you apply this role straight-out-of-the-box, there is a 99% chance you will bork your system. Please take the time to familarise yourself with the standard and with the configurable default values, and exclude any items before applying to a system.

An examples of items that should be considered for exclusion (or at least, for modification of the related default values) include:

* ```3.4.2``` and ```3.4.3```, which by default effectively limit access to the host (including via ssh) to localhost only.

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

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

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

* 4.2.1.2. The determination of what should be logged and the destination of messages is environment specific.
* 4.2.2.2. The determination of what should be logged and the destination of messages is environment specific.
* 4.2.2.3. Inline editing of syslog-ng configuration file is considered too imprecise and is best solved by a supplied configuration file which addresses this and other related requirements.
* 4.2.2.4. Inline editing of syslog-ng configuration file is considered too imprecise and is best solved b
y a supplied configuration file which addresses this and other related requirements.
* 4.2.2.5. Inline editing of syslog-ng configuration file is considered too imprecise and is best solved b
y a supplied configuration file which addresses this and other related requirements.
* 5.3.2. Multi-line editing of pam configuration files is considered too imprecise and dangerous, and is best solved by a supplied configuration file which addresses this and other related requirements.
* 5.3.3. Multi-line editing of pam configuration files is considered too imprecise and dangerous, and is b
est solved by a supplied configuration file which addresses this and other related requirements.

License
-------

BSD. 

Author Information
------------------

This role was developed by [Anth Courtney](https://au.linkedin.com/in/anthcourtney).

All feedback, issues and PRs are encouraged and appreciated.
