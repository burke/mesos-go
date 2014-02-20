Go bindings for Apache Mesos
========

Early Go language bindings for Apache Mesos.

## Install instructions

ssh into your current leading master node.
Record the IP of the HDFS name node to publish your built executor.

### On OS X

    $ brew install protobuf

Additionally, you'll need mesos installed for libmesos.

    (visit http://mesosphere.io/downloads/)
    (find a package for OS X, eg:)
    $ curl -O http://downloads.mesosphere.io/master/osx/mesos_0.17.0-rc1_x86_64.pkg
    $ open mesos_*.pkg

### On Ubuntu/Debian

    $ sudo apt-get install -y build-essential

Additionally, you will need protobuf-2.5.0 installed. `apt-get install libprotobuf-dev` is likely not recent enough:

    $ curl https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.gz | tar xf
    $ cd protobuf-2.5.0
    $ ./configure && make && sudo make install

You will also need `libmesos`. The easiest way is to install a `.deb` from mesosphere:

    (visit http://mesosphere.io/downloads/)
    (then, for example...)
    $ wget http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.17.0-rc1_amd64.deb
    $ sudo dpkg -i mesos_*.deb

In case your distribution does not include Go 1.2+, please fetch a more recent version:

    $ sudo apt-get install python-software-properties
    $ sudo add-apt-repository ppa:duh/golang
    $ sudo apt-get update
    $ sudo apt-get install golang

### Compile example framework and executor

    $ go install github.com/burke/mesos-go/example_framework
    $ go install github.com/burke/mesos-go/example_executor

### Install example executor in HDFS

    $ hadoop fs -mkdir /go-tmp
    $ hadoop fs -put $GOPATH/bin/example_executor /go-tmp

### Run example framework:

    $ $GOPATH/bin/example_framework -executor-uri hdfs://<hdfs-name-node>/go-tmp/example_executor
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

