tac-agent
=========

Checking out the repository
---------------------------

To make sure that the tac code is always up to date, the TAC repository is
linked to this one using git submodules. To properly check out the TAC
repository after cloning this one, you simple need to do two steps:

1. git submodule init
2. git submodule update

Building and running
--------------------

1. To compile every file in the [src](src) directory run ```shell $ ant
```. This will create a jar of all of your files (agents) in to the jar locatted
at [dist/tac-adx-agent.jar](dist/tac-adx-agent.jar).
2. To run the server use ```shell $ ./runServer.sh ``` (```shell $
./runServer.sh & ``` to run the server in the background)..
3. To run an agent agains this server run ```shell $ ./runAgent.sh [agent java
class name] ```. To run the sample agent you can run ```shell $ ./runAgent.sh
SampleAdNetwork ``` or ```shell $ ./runAgent.sh ``` because the script defaults
to running the sample agent.

Creating your own agent
-----------------------

For your convenience a modified sample agent
([SampleAdNetwork.java](src/edu/umich/tacadx/agents/SampleAdNetwork.java))
already exists in [src/edu/umich/tacadx/agents](src/edu/umich/tacadx/agents). To
create your own agent simple create another java file in
src/edu/umich/tacadx/agents the conforms to the interface specified in the
sample agent. I recommend copying and renaming the sample agent, and then making
modifications.

Example
-------

Here are an example set of commands to get a new agent running. Note that the
agent has the same behavior as the sample agent.

```shell
$ cp src/edu/umich/tacadx/agents/{Sample,Copy}AdNetwork.java
$ sed -i -e's/SampleAdNetwork/CopyAdNetwork/g' src/edu/umich/tacadx/agents/CopyAdNetwork.java
$ ant
$ ./runServer.sh &
$ ./runAgent CopyAdNetwork
```
