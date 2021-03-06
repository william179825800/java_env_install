#!/bin/bash

mkdir /java

yum -y install wget

yum install glibc.i686 -y

echo '***************************************'
echo '*                                     *'
echo '*      Jdk1.8 install ...             *'
echo '*                                     *'
echo '***************************************'

wget -O jdk-8u144-linux-i586.tar.gz http://om40sen9v.bkt.clouddn.com/14ca4f70f43e41f4a593fee6e56a1541.gz

tar -xzvf jdk-8u144-linux-i586.tar.gz

rm -f -r jdk-8u144-linux-i586.tar.gz

mv  jdk1.8.0_144  /java/jdk1.8

echo '***************************************'
echo '*                                     *'
echo '*      Maven3.5 install ...           *'
echo '*                                     *'
echo '***************************************'

wget http://mirrors.hust.edu.cn/apache/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz

tar -xzvf apache-maven-3.5.3-bin.tar.gz

rm -f -r  apache-maven-3.5.3-bin.tar.gz

mv  apache-maven-3.5.3 /java/apache-maven-3.5.3


echo 'export JAVA_HOME=/java/jdk1.8' >> /etc/profile

echo 'export JRE_HOME=${JAVA_HOME}/jre' >> /etc/profile

echo 'export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib' >> /etc/profile

echo 'export PATH=${JAVA_HOME}/bin:$PATH' >> /etc/profile

echo 'export MAVEM_HOME=/java/apache-maven-3.5.3' >> /etc/profile

echo 'export PATH=${MAVEM_HOME}/bin:$PATH' >> /etc/profile


source /etc/profile

echo '***************************************'
echo '*                                     *'
echo '*      Tomcat8.5 install ...          *'
echo '*                                     *'
echo '***************************************'

wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.30/bin/apache-tomcat-8.5.30.tar.gz

tar -zxvf apache-tomcat-8.5.30.tar.gz  

rm -f -r apache-tomcat-8.5.30.tar.gz 

mv  apache-tomcat-8.5.30 /java/apache-tomcat-8.5

cd /java/apache-tomcat-8.5/bin/

./startup.sh

java -version

mvn -v
