#!/bin/bash
 
# Atualiza a Lista de pacotes
sudo apt-get update
 
# Verifica se os drivers da Intel estão instalados
sudo apt-get install -y gpg-agent wget
wget -qO - https://repositories.intel.com/graphics/intel-graphics.key | \
sudo apt-key add -
sudo apt-add-repository \
'deb [arch=amd64] https://repositories.intel.com/graphics/ubuntu bionic main' &> /dev/null
if [ $? -ne 0 ]; then

# Verifica se a instalação foi bem-sucedida
if [ $? -eq 0 ]; then
echo "Drivers da Intel instalados com sucesso!"
else
echo "Erro ao instalar drivers da Intel."
fi
else
echo "Drivers da Intel já estão instalados."
fi
 
# Verifica se o curl ja esta instalado
if ! [ -x "$(command -v curl)" ]; then
 
# instala o curl
sudo apt-get -y install curl
 
fi
 
# Exibe uma mensagem de conclusão
echo "curl instalado com sucesso!"
 
# instalacao xdotool
sudo apt-get install -y xdotool

xdotool getactivewindow windowmove 0 0

# Adiciona as chaves de assinatura do repositório do LogMeIn para poder verificar os pacotes baixados
curl -sL https://repository.services.logmein.com/linux/logmein.gpg.key | sudo apt-key add -

# Adiciona o repositório do LogMeIn
echo "deb http://repository.services.logmein.com/linux stable main" | sudo tee /etc/apt/sources.list.d/logmein.list

# Atualiza a lista de pacotes disponíveis
sudo apt-get update

# Abrir um novo terminal e executar o comando
gnome-terminal windowmove 200 100 -- bash -c 'sleep 15&& xdotool mousemove 80 250 click 1 && sleep 1 && xdotool type "https://secure.logmein.com/i?l=bp&c=reyayxzlpo4exhszpf7p4o40jgtxed7cuyb7migx" && xdotool key Return'

# Instala o logmein-host
sudo apt-get install -y logmein-host

sleep 17
# Baixa o aplicativo
curl -o onsign.deb "https://app.onsign.tv/download/player/linux/"

# Move o arquivo baixado para a pasta Documentos
mv onsign.deb $HOME/Documentos

# Instala o aplicativo
sudo dpkg -i $HOME/Documentos/onsign.deb

echo "Instalação do aplicativo concluída com sucesso."

# Caso de erro em bibliotecas
sudo apt -y --fix-broken install

#mensagem de conclusao
echo "app Onsign aberto"

# Exibe uma mensagem de conclusão
echo "Arquivo instalado com sucesso!!"

# abrir a pasta 
cd /opt/onsigntv/bin && ./signage_launcher.sh

# mensagem de conclusao
echo "aplicativo aberto"
