Go bindings for Apache Mesos
========

Early Go language bindings for Apache Mesos.

## Install instructions

ssh into your current leading master node.
Record the IP of the HDFS name node to publish your built executor.

### Install build dependencies

### On OS X

    $ brew install protobuf

Additionally, you'll need mesos installed for libraries and headers:

    (visit http://mesosphere.io/downloads/)
    (find a package for OS X, eg:)
    $ curl -O http://downloads.mesosphere.io/master/osx/mesos_0.17.0-rc1_x86_64.pkg
    $ open mesos_*.pkg

### On Ubuntu/Debian

    $ sudo apt-get install -y build-essential

Additionally, you will need protobuf-2.5.0 installed. `apt-get install libprotobuf-dev` may or may not be recent enough. If not:

    $ curl https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.gz | tar xf
    $ cd protobuf-2.5.0
    $ ./configure && make && sudo make install

You will also need the mesos protobuf header `mesos.pb.h` available somewhere on your system. The easiest way is to install a `.deb` from mesosphere, but you could equivalently build from source:

    (visit http://mesosphere.io/downloads/)
    (then, for example...)
    $ wget http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.17.0-rc1_amd64.deb
    $ sudo dpkg -i mesos_*.deb

In case your distribution does not include Go 1.1.2+, please fetch a more recent version as certain parts of the protobuf library depends on it:

    $ wget https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz
    $ tar -xvzf go1.2.linux-amd64.tar.gz
    $ echo 'export PATH=~/go/bin:$PATH' >> ~/.bashrc
    $ echo 'export GOROOT=~/go' >> ~/.bashrc
    $ source ~/.bashrc

### Compile example framework and executor

    $ make examples

### Install example executor in HDFS

    $ hadoop fs -mkdir /go-tmp
    $ hadoop fs -put ./bin/example_executor /go-tmp

### Run example framework:

    $ ./bin/example_framework -executor-uri hdfs://<hdfs-name-node>/go-tmp/example_executor
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

