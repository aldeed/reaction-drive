reaction-drive
==============

Reaction Provisioning tools

Dockerfile:

Install Docker, edit Dockerfile meteor ENV lines

  VBoxManage controlvm boot2docker-vm natpf1 "name,tcp,127.0.0.1,8080,,8080"

Add reaction.tar.gz meteor bundle in this directory
then:


  docker build -t ongoworks/reaction-dev .
  docker run -p 8080:8080 -d  ongoworks/reaction-dev

