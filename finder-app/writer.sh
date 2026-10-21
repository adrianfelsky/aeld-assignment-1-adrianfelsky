#!/bin/sh

if [ $# -lt 2 ]; then
    echo -e "Erro: Argumentos faltando...\nUso: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

writedir=$(dirname "$writefile")


if [ ! -d "$writedir" ]; then

    echo -n "Diretório $writedir não existe, deseja criá-lo? (s/n) >> "
    read resposta

    if [ "$resposta" = "s" ]; then
        mkdir -p "$writedir"
    else
        echo "Operação cancelada."
        exit 1
    fi

    if [ $? -ne 0 ]; then
        echo "Erro: Não foi possível criar o diretório '$writedir'."
        exit 1
    fi
fi

echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Erro: Não foi possível criar o arquivo '$writefile'."
    exit 1
fi

echo "Arquivo '$writefile' criado com sucesso."