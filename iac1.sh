#!/bin/bash

# Parar o script em caso de erro
set -e

echo "Criando diretórios..."

mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM || echo "Grupo GRP_ADM já existe."
groupadd GRP_VEN || echo "Grupo GRP_VEN já existe."
groupadd GRP_SEC || echo "Grupo GRP_SEC já existe."

echo "Criando usuários e adicionando aos grupos..."

# Gerando hashes SHA-512 para as senhas
PASSWORD_HASH_CARLOS=$(openssl passwd -6 Senha123)
PASSWORD_HASH_MARIA=$(openssl passwd -6 Senha123)
PASSWORD_HASH_JOAO=$(openssl passwd -6 Senha123)

PASSWORD_HASH_DEBORA=$(openssl passwd -6 Senha123)
PASSWORD_HASH_SEBASTIANA=$(openssl passwd -6 Senha123)
PASSWORD_HASH_ROBERTO=$(openssl passwd -6 Senha123)

PASSWORD_HASH_JOSEFINA=$(openssl passwd -6 Senha123)
PASSWORD_HASH_AMANDA=$(openssl passwd -6 Senha123)
PASSWORD_HASH_ROGERIO=$(openssl passwd -6 Senha123)

# Criando usuários com as senhas criptografadas
useradd carlos -c "Carlos da Silva" -m -s /bin/bash -p "$PASSWORD_HASH_CARLOS" -G GRP_ADM
useradd maria -c "Maria da Silva" -m -s /bin/bash -p "$PASSWORD_HASH_MARIA" -G GRP_ADM
useradd joao -c "João da Silva" -m -s /bin/bash -p "$PASSWORD_HASH_JOAO" -G GRP_ADM

useradd debora -c "Débora" -m -s /bin/bash -p "$PASSWORD_HASH_DEBORA" -G GRP_VEN
useradd sebastiana -c "Sebastiana" -m -s /bin/bash -p "$PASSWORD_HASH_SEBASTIANA" -G GRP_VEN
useradd roberto -c "Roberto" -m -s /bin/bash -p "$PASSWORD_HASH_ROBERTO" -G GRP_VEN

useradd josefina -c "Josefina" -m -s /bin/bash -p "$PASSWORD_HASH_JOSEFINA" -G GRP_SEC
useradd amanda -c "Amanda" -m -s /bin/bash -p "$PASSWORD_HASH_AMANDA" -G GRP_SEC
useradd rogerio -c "Rogério" -m -s /bin/bash -p "$PASSWORD_HASH_ROGERIO" -G GRP_SEC

echo "Especificando permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim..."

