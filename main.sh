#!/bin/bash
nomeDoJogo=""$(basename "$PWD")""

pastaBase="$(dirname $0)"
localSalvamento="$pastaBase/Backups/$nomeDoJogo"
arquivoConfig="$localSalvamento/$nomeDoJogo.conf"

echo $pastaBase

echo "Iniciando script de backup do $nomeDoJogo..."
echo "$PWD" 
echo $pastaBase
if [ ! -f "$arquivoConfig" ]; then
    echo "arquivo de configuração para $nomeDoJogo não encontrado, criando um novo..." >> "$pastaBase/log.log"
    mkdir -p "$localSalvamento" 
    touch "$arquivoConfig" 
    echo "arquivo de configuração criado em: $arquivoConfig" >> "$pastaBase/log.log"
    echo -e "quantidadeMaximaPorDia=3 \npastaDoSave='' "  >> "$arquivoConfig"
fi

. "$arquivoConfig" ## le arquivo de config e puxa as variaveis 

echo $quantidadeMaximaPorDia
echo $nomeDoJogo


read -p "Pressione ENTER para fechar..."

# if (($OSTYPE == "cygwin" || $OSTYPE == "msys" || $OSTYPE == "win32")); then
#     "C:\Program Files (x86)\Steam\steamapps\common\Balatro\Balatro.exe"
#     echo "Windows"
#     echo "Please run this script in a Linux environment."
# else (( )); then
#     echo "Linux"
#     ./Balatro
# fi

# $0 local atual deste arquivo


# nomeArquivo=$(date "+%d_%m %H-%M");
# comp=$(date -Format "%d_M");

# save="$HOME\AppData\Roaming\Balatro\1";

#  find -name "$(date +%d_%m)*" | wc -l

#  rm $(find -name "$(date +%d_%m)*" | head -n 1)

# data=$(date +%d_%m); 

# if (($(find -name "$data*" | wc -l) > $quantidadeMaximaPorDia)); then 
#   echo "ja existem 3 backups hoje, não e possível criar mais.";
# fi