# ElmerUbuntu18.04
Dispõe de um arquivo shell que automatiza a instalação do Elmer no Ubuntu 18.04

#1º instale o pacote do git no seu ubuntu
$sudo apt get install git

#2º use uma função do git para baixar o arquivo shell no repositório atual
$git clone https://github.com/Aleqssandro-Farias/ElmerUbuntu18.04.git

#3º dê a permissão para executar o arquivo shell
$sudo chmod +x ./installElmer.sh

#4º execute o arquivo shell
$./installElmer.sh

#5º acompanhe a instalação, em algumas etapas pedirá sua confirmação (s/n)? digite "s" e dê enter

#6º deverá editar o arquivo ~/.bashrc, para isso execute ele com o "gedit" e apague toda a parte que faz referência ao MKL até o Elmer, a primeira linha a ser apagada é "mkl='source /opt/inte.....". Apague dessa parte inicial até o final.
$sudo gedit ~/.bashrc
# esse comando irá abrir o editor de texto aí faça esses passos manualmente

#7º adicione o texto abaixo ao final do arquivo ~/.bashrc e salve:
### mkl ###
mkl='source /opt/intel/oneapi/mkl/2023.2.0/env/vars.sh'
MKL_LIB_PATH=/opt/intel/oneapi/mkl/2023.2.0/lib/intel64
OMP_LIB_PATH=/opt/intel/oneapi/mkl/2023.2.0/lib/intel64

export LD_LIBRARY_PATH=${MKL_LIB_PATH}:${OMP_LIB_PATH}

### elmer ###
export ELMER_HOME=$HOME/elmer/install/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ELMER_HOME/lib
export PATH=$PATH:$ELMER_HOME/bin

#8º após isso atualize o bashrc
$source ~/.bashrc

# está pronto! vamos testar?
$ElmerGUI
