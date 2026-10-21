#!/bin/sh

if [ $# -lt 2 ]; then
    echo -e "Erro: Argumentos faltando...\nUso: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "Erro: '$filesdir' não é um diretório válido."
    exit 1
fi

X=$(find "$filesdir" -type f | wc -l)
Y=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "O número de arquivos é ${X} e o número de linhas correspondentes é ${Y}."

