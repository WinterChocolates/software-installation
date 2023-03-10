#!/bin/bash
echo "欢迎使用软件安装脚本"
echo
echo "==================================="
echo "1.安装python3.9  2.卸载python3.9"
echo "3.安装git2.39.0  4.卸载git2.39.0"
echo "5.安装ffmpeg     6.卸载ffmpeg"
echo "==================================="
echo
while read -p "请输入以上序号：" num
do
	case $num in
		1)
			rm -rf /usr/bin/python3
			rm -rf /usr/bin/pip3
			apt update && apt install -y wget gcc tar make build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libbz2-dev liblzma-dev sqlite3 libsqlite3-dev tk-dev uuid-dev libgdbm-compat-dev
			wget -P /usr/local/src https://repo.huaweicloud.com/python/3.9.10/Python-3.9.10.tgz
			cd /usr/local/src/
			tar -zxvf Python-3.9.10.tgz
			cd Python-3.9.10
			./configure --prefix=/usr/local/python3
			make && make install
			echo -e '# python3.9.10\nexport PYTHON_HOME=/usr/local/python3\nexport PATH=$PYTHON_HOME/bin:$PATH' >> /etc/profile
			source /etc/profile
			python3 --version
			pip3 --version
			rm -rf /usr/local/src/*
			break
			;;
		2)
			rm -rf /usr/local/python3
			rm -rf /usr/local/bin/python3
			rm -rf /usr/local/bin/pip3
			sed -i '/# python3.9.10/d' /etc/profile
			sed -i '/PYTHON_HOME/d' /etc/profile
			source /etc/profile
			echo "卸载成功"
			break
			;;
		3)
			apt remove -y git
			apt update && apt install -y wget gcc make gzip tar wget libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
			wget -P /usr/local/src https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.39.0.tar.xz
			cd /usr/local/src/
			tar -xf git-2.39.0.tar.xz
			cd /usr/local/src/git-2.39.0
			./configure --prefix=/usr/local/git
			make && make install
			echo -e '# Git2.39.0\nexport PATH=/usr/local/git/bin:$PATH' >> /etc/profile
			source /etc/profile
			git --version
			rm -rf /usr/local/src/*
			echo "安装成功"
			break
			;;
		4)
			rm -rf /usr/local/git
			rm -rf /usr/local/bin/git
			sed -i '/# Git2.39.0/d' /etc/profile
			sed -i '/git/d' /etc/profile
			source /etc/profile
			echo "卸载成功"
			break
			;;
		5)
			apt update && apt-get install -y ffmpeg
			echo "安装成功"
			break
			;;
		6)
			apt-get remove -y ffmpeg
			echo "卸载成功"
			break
			;;
		*)
			echo "输入序号不为显示中的，请重新输入"
			continue
			;;
	esac
done
