# Ansible Role: Redis
Installs and configures an in-memory data structure store.

## Requirements
None

## Role Variables
- redis_bind: 127.0.0.1
- redis_port: 6379
- redis_databases: 16

## Dependencies
- shomatan.repo-epel

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: shomatan.redis, x: 42 }

## License
MIT

## Author Information
Shoma Nishitateno
