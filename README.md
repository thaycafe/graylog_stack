## Ansible Role para Graylog Stack

**Versões**
- Graylog: 4.2
- Mongodb: 4.4
- Elasticsearch: 7.11



### Exemplo de playbook:

```yml
---
- hosts: all
  become: yes
  vars:
    graylog_root_password_sha2: "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918"
    graylog_password_secret: "2jueVqZpwLLjaWxV"
  roles:
    - graylog_stack
```

> As variaveis **graylog_root_password_sha2** e **graylog_root_password_sha2** são obrigatórias. Essas valores no exemplo garante que a senha seja _admin_.

Para gerar a password_secret:

```bash
pwgen -s 96 1
```

Para gerar root_password_sha2:

```bash
echo -n "Enter Password: " && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1
```
