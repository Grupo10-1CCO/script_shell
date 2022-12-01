#!/bin/bash

sudo docker stop ConteinerBD
sudo docker rm ConteinerBD


echo "$(tput setaf 10)[SAMP]:$(tput setaf 7) : Verificando se o docker está instalado"


docker version
if [ $? -eq 0 ]
        then
                echo "$(tput setaf 10)[SAMP]:$(tput setaf 7) : Você já tem Docker no seu dispositivo!"
        else
                echo "$(tput setaf 10)[SAMP]:$(tput setaf 7)  Não foi identificada nenhuma versão do Docker em seu dispositivo."

                        echo "$(tput setaf 10)[SAMP]:$(tput setaf 7)  preparando para instalação do Docker"
                        echo "$(tput setaf 10)[SAMP]:$(tput setaf 7)  Adicionando o repositório!"
                        sleep 2
                        sudo apt install docker.io -y

                        echo "$(tput setaf 10)[SAMP]:$(tput setaf 7)  Atualizando..."
                        sleep 2
                        sudo apt update -y

                        echo "$(tput setaf 10)[SAMP]:$(tput setaf 7) Processo finalizado."

fi

echo "$(tput setaf 10)[SAMP]:$(tput setaf 7) Startando docker."


    
    sudo systemctl start docker
        sudo systemctl enable docker

 echo "$(tput setaf 10)[SAMP]:$(tput setaf 7) : instalando mysql no docker e criando banco com o nome do projeto"   
    
    sudo docker pull dnlydg/bdsamp:1.0
        sudo service mysql stop
    sudo docker run -d --name ConteinerBD dnlydg/bdsamp:1.0

echo "$(tput setaf 10)[SAMP]:$(tput setaf 7) : Instalando o Java "

sudo apt install default-jre default-jdk -y

echo "$(tput setaf 10)[SAMP]:$(tput setaf 7) : Clonando o repostiorio coma a API "
I
git clone https://github.com/Grupo10-1CCO/Java.git

echo "$(tput setaf 10)[SAMP]:$(tput setaf 7) : Iniciando a API "
cd Java/sampjframe/target
java -jar sampjframe-1.0-SNAPSHOT-jar-with-dependencies.jar
