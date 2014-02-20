Go bindings for Apache Mesos
========

Early Go language bindings for Apache Mesos.

## Install instructions

### Install `libprotobuf`

#### OS X

    brew install protobuf

#### Ubuntu/Debian

You will need version 2.5.0 or higher. The one `apt-get` grabs isn't high enough.

    cd /tmp
    curl https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.gz | tar xf
    cd protobuf-2.5.0 && ./configure && make && sudo make install

### Install `libmesos`

#### OS X

visit http://mesosphere.io/downloads and find a package for OS X, eg:

    cd /tmp
    curl -O http://downloads.mesosphere.io/master/osx/mesos_0.17.0-rc1_x86_64.pkg
    open mesos_*.pkg

#### Ubuntu/Debian

visit http://mesosphere.io/downloads and find a package for your release, eg:

    # (visit http://mesosphere.io/downloads/)
    # (then, for example...)
    wget http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.17.0-rc1_amd64.deb
    sudo dpkg -i mesos_*.deb

### Upgrade to Go 1.2

Go 1.2 is necessary to build this project, as it relies on new features for compiling with C++.

#### OS X

    brew update && brew upgrade go

#### Ubuntu/Debian

    sudo apt-get install python-software-properties
    sudo add-apt-repository ppa:duh/golang
    sudo apt-get update
    sudo apt-get install golang

### Build

    go get github.com/burke/mesos-go

## Examples

### Compile example framework and executor

    go install github.com/burke/mesos-go/example_framework
    go install github.com/burke/mesos-go/example_executor

### Install example executor in HDFS

    hadoop fs -mkdir /go-tmp
    hadoop fs -put $GOPATH/bin/example_executor /go-tmp

### Run example framework:

    $GOPATH/bin/example_framework -executor-uri hdfs://<hdfs-name-node>/go-tmp/example_executor

You should see output like:

    Launching task: 5
    Received task status: Go task is running!
    Received task status: Go task is done!
    Launching task: 4
    Received task status: Go task is running!
    Received task status: Go task is done!
    Launching task: 3
    Received task status: Go task is running!
    Received task status: Go task is done!
    Launching task: 2
    Received task status: Go task is running!
    Received task status: Go task is done!
    Launching task: 1
    Received task status: Go task is running!
    Received task status: Go task is done!

