nomeDoJogo=""$(basename "$PWD")""
pastaBase="$(dirname $0)"
localSalvamento="$pastaBase/Backups/$nomeDoJogo"
localConfig="$pastaBase/Config/"
arquivoConfig="$localConfig/$nomeDoJogo.conf"

echo $pastaBase

echo "Iniciando script de backup do $nomeDoJogo..."
echo "$PWD" 
echo $pastaBase
if [ ! -f "$arquivoConfig" ]; then
    echo "arquivo de configuração para $nomeDoJogo não encontrado, criando um novo..." >> "$pastaBase/logs.log"
    # mkdir -p "$localSalvamento" 
    mkdir -p "$localConfig"
    touch "$arquivoConfig" 
    echo "arquivo de configuração criado em: $arquivoConfig" >> "$pastaBase/logs.log"
    echo -e 'quantidadeMaximaPorDia=3
            \npastaDoSave=""' > "$arquivoConfig"
fi

. "$arquivoConfig" ## le arquivo de config e puxa as variaveis 

echo $pastaDoSave

if [[ "$pastaDoSave" == "" ||  ! -d "$pastaDoSave" ]]; then
    echo "pasta de salvamento não configurada, não encontrada ou não é um diretório 
    por favor confira a pasta de salvamento no arquivo de configuração:" 
    exit 1
fi

nomeArquivo="save $(date "+%d_%m %H-%M")"

cp -r "$pastaDoSave" "$localSalvamento/$nomeArquivo"



data=$(date +%d_%m); 
# find "$localSalvamento" -name "save $data*" | wc -l
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


# comp="save $(date -Format "%d_M")"

# save="$HOME\AppData\Roaming\Balatro\1";

#  find -name "$(date +%d_%m)*" | wc -l

#  rm $(find -name "$(date +%d_%m)*" | head -n 1)


# if (($(find "$localSalvamento" -name "save $data*" | wc -l) > $quantidadeMaximaPorDia)); then
#     echo "ja existem 3 backups hoje, mais antigo apagado." >> $pastaBase/logs.log
# fi