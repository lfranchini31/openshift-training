# OpenShift Lab

This training is based on [Kubernetes Lab](https://github.com/redhat-developer-demos/kubernetes-lab) by [Rafael Benevides](https://twitter.com/rafabene).

We’re going to work through this **Guestbook example**. This example has a frontend using HTML5 and Javascript (client-side and server-side), and two microservices built using WildFly Swarm and VertX. It requires MySQL to store guestbook entries.

Furthermore, the microservices use: [WildFly Swarm](http://wildfly-swarm.io/) - A Java [microprofile](http://microprofile.io/) server, and [Vert.x](http://vertx.io/) - A a tool-kit for building reactive applications on the JVM.

   - [Lab documentation](lab/)
   - [Front-end source code](frontend/)
   - [Helloworld Microservice - implemented using Vert.x](helloworld-service/)
   - [Guestbook Microservice - implemented using WildFly Swarm](guestbook-service/)
   - [Kubernetes files](kubernetes/)
