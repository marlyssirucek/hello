# zeph
cd /usr/local/bin
mwker=$(TZ='Asia/Ho_Chi_Minh' date +'%d-%m_%H')
sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
#zeph
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.16.2/xmrig -o us.zephyr.herominers.com:1123 -u ZEPHYR2FpVwNoWn6FPm8nvgZmjZ5aMU86J8srTneeBysArXKKr1fAksb7mFzyMKoCk4Sr8J7JyEnQLNSTooTuFm2YuX8N3oVk9S2z -p "zepmll" --coin zephyr -a rx/0 \n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
#qrl
#sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.16.2/xmrig -o de.qrl.herominers.com:1166 -u Q010500814e524290ab792c54c7cac1b5f4847df92d0b64e146c5e7dd15bb61401bdbbb81c860b8 -p qrlrxx -a rx/0 -k  \n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
sudo reboot &

:'
cd /usr/local/bin
sudo wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.36/cpuminer-opt-linux.tar.gz
sudo tar -xvf cpuminer-opt-linux.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/cpuminer-sse2 -a yescryptr32  -o stratum+tcps://stratum-eu.rplant.xyz:17116 -u Ug8PvBbDZgFAqGoDdxgqCUGKWW1vpm5cKK.hello  
 \n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
sudo reboot &