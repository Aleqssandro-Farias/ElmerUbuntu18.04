sudo apt autoremove intel-basekit 

wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB \
| gpg --dearmor | sudo tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null 


echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list 

sudo apt-get update

sudo apt install intel-basekit

echo "" >> $HOME/.bashrc
echo "### mkl ###" >> $HOME/.bashrc
echo "mkl='source /opt/intel/oneapi/mkl/2023.2.0/env/vars.sh'" >> $HOME/.bashrc 
echo "MKL_LIB_PATH=/opt/intel/oneapi/mkl/2023.2.0/lib/intel64" >> $HOME/.bashrc 
echo "OMP_LIB_PATH=/opt/intel/oneapi/mkl/2023.2.0/lib/intel64" >> $HOME/.bashrc 

source ~/.bashrc

source /opt/intel/oneapi/mkl/2023.2.0/env/vars.sh

echo "export LD_LIBRARY_PATH=${MKL_LIB_PATH}:${OMP_LIB_PATH}" >> $HOME/.bashrc 

source ~/.bashrc

sudo apt-get install git cmake gfortran libblas-dev liblapack-dev -y

sudo apt-get -y install cmake-qt-gui

sudo apt install libqt4-dev

sudo apt install libmumps-dev 

sudo apt-get install libqt5xml5

sudo apt install libblacs-mpi-dev

sudo apt install qt5-default 

sudo apt install qtdeclarative5-dev 

sudo apt install libparmetis-dev 

sudo apt install libmetis-dev 

sudo apt install libscotch-dev

mkdir elmer

cd elmer

git clone https://github.com/ElmerCSC/elmerfem.git

mkdir build

cd build 

sudo apt install qtcreator  

sudo apt-get install build-essential -y

sudo apt-get install mesa-common-dev

sudo apt install qt5-default

sudo apt install qt5-doc qt5-doc-html qtbase5-doc-html qtbase5-examples qtscript5-dev libqt5svg5-dev

source /opt/intel/oneapi/mkl/2023.2.0/env/vars.sh

cmake  \
-DWITH_ELMERGUI:BOOL=TRUE \
-DWITH_LUA=TRUE \
-DWITH_MKL=TRUE \
-DWITH_MPI:BOOL=TRUE \
-DWITH_MATC:BOOL=TRUE \
-DWITH_Mumps=TRUE \
-DWITH_PARAVIEW:BOOL=TRUE \
-DWITH_QWT:BOOL=FALSE \
-DWITH_Zoltan=FALSE \
-DMETIS_INSTALL=TRUE \
-DMETIS_SHARED=TRUE \
-DCMAKE_INSTALL_PREFIX=../install ../elmerfem  2>&1 | tee  log.cmake

#substitua o '6' pelo número de cores (núcleos que seu computador possui), para verificar o número de cores basta digitar na barra de programas pelo "Monitor de sistema", ir na aba "Resursos" e verificar quantos CPU tem, Exemplo: "CPU1, CPU2, CPU3, CPU4, CPU5, CPU6"
make -j6 install  2>&1 | tee  log.make.install  

echo "" >> $HOME/.bashrc
echo "### elmer ###" >> $HOME/.bashrc
echo "export ELMER_HOME=$HOME/elmer/install/" >> $HOME/.bashrc 
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ELMER_HOME/lib" >> $HOME/.bashrc 
echo "export PATH=$PATH:$ELMER_HOME/bin" >> $HOME/.bashrc 

source ~/.bashrc

