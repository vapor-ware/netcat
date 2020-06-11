# netcat

Simple Alpine image for running netcat (`nc`).

Use this when you don't have netcat installed on your system or you want to use this image as a
base for simple service demos.

## Example using the host network

Start a netcat server in one terminal

    $ docker run -t --rm --network=host --name=ncs vaporio/netcat -vl 8888

Note: we use the host network stack (`host`) which means that port `8888` in the
container is available on port `8888` of the host machine. Since we are using the host
network stack directly it is not necessary to explicitly "publish" the port to the host
network (using the `-p|--publish` option). In any case, the netcat command itself still
needs to be told which port it is supposed to listen to, so `8888` is supplied as the
argument to the default process for the container (which is `netcat`) created by the
`vaporio/netcat` image at the end of the `docker run` command.

Send a message to the server from another terminal

    $ docker run -i --rm --network=host vaporio/netcat localhost 8888
    hello # will see hello echoed at the other terminal

Here, supply `localhost` and `8888` as the host and port arguments to the default
command running in the container (`netcat`) created from the `vaporio/netcat`
image. Remember, the host is `localhost` (or `127.0.0.1`) because we started a netcat listener in
another container attached to the `host` network.

### TIP

You can set aliases in your shell configuration to reduce typing:

    $ alias ncs="docker run -t --rm --network=host --name=ncs vaporio/netcat -vl"
    $ alias nc="docker run -i --rm --network=host --name=nc vaporio/netcat localhost"

Then the example above looks like this:

Start netcat server in one terminal

    $ ncs 8888

Send a message from another terminal

    $ echo "hello world" | nc 8888

To kill both containers from yet another terminal

    $ docker rm -f nc ncs


