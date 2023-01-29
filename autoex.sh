#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
echo ''
else
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi
bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi
sleep 1 && curl -s https://raw.githubusercontent.com/tinnguyen162002/logo/main/logo.sh | bash && sleep 2

	if [ ! $name_ex ]; then
		read -p "tên node :" name_ex
		echo 'export name_ex='${name_ex} >> $HOME/.bash_profile
	fi
	echo -e '\n\e[42mYour node name:' $name_ex '\e[0m\n'
	if [ ! $wallet_ex ]; then
		read -p "nhập địa chỉ ví: " wallet_ex
		echo 'export wallet_ex='${wallet_ex} >> $HOME/.bash_profile
	fi
	echo -e '\n\e[42mđịa chỉ là:' $wallet_ex '\e[0m\n'
	if [ ! $mem_ex ]; then
		read -e -p "nhập số gb ram [-1]: " rem_ex
		echo 'export rem_ex='${rem_ex:--1} >> $HOME/.bash_profile
	fi
	echo -e '\n\e[42msố bộ nhớ ram:' $rem_ex '\e[0m\n'
	echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
	. $HOME/.bash_profile
	sleep 1
echo -e '\n\e[42mInstall Docker\e[0m\n' && sleep 1
sudo apt install docker.io -y
echo -e '\n\e[42mInstall ZIP\e[0m\n' && sleep 1

sudo apt install unzip
echo -e '\n\e[42mInstall exdore\e[0m\n' && sleep 1


((count+= rem_ex / 2 ))
((i=0)) 
while [ $i -le $count ]
do
docker run -d --restart unless-stopped --pull always --name $name_ex$i exordelabs/exorde-cli -m $wallet_ex -l 4
i=`expr $i + 1`
done 
