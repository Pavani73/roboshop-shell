echo -e "\e[33mCopy mongodb config file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo  &>>/tmp/roboshop.log

echo -e "\e[33mInstall mongodb server\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log

echo -e "\e[33mUpdate Mongodb Listen Address\e[0m"
sed -i 's/127.0.0.0/0.0.0.0/' /etc/mongod.conf

#modify the mongodb config file
echo -e "\e[33mStart mongodb serevr\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl start mongod  &>>/tmp/roboshop.log