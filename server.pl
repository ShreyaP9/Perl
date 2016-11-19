use IO::Socket::INET;
 
# auto-flush on socket
$| = 1;
 
# creating a listening socket
my $socket = new IO::Socket::INET (
    LocalHost => '10.2.10.189',				#server's ip 
    LocalPort => '8014',				#change the port. client and server port should be same
    Proto => 'tcp',					#listen to 5 requests. processes one at a time
    Listen => 5,
    Reuse => 1
);
die "cannot create socket $!\n" unless $socket;
print "server waiting for client connection on port 7777\n";
 
while(1)
{
    # waiting for a new client connection
    my $client_socket = $socket->accept();
	
	while (<$client_sock>) {
    print $_;
}
	my $rv = sysread($client_sock, my $buf, 64*1024);
 
    # get information about a newly connected client
    my $client_address = $client_socket->peerhost();
    my $client_port = $client_socket->peerport();
    print "connection from $client_address:$client_port\n";
 
    # read up to 1024 characters from the connected client
    my $data = $line
    $client_socket->recv($data, 1024);
    print "received data: $data\n";
 
    # write response data to the connected client
    #$data = "ok";
    $client_socket->send($data);
 
    # notify client that response has been sent
    shutdown($client_socket, 1);
}
 
$socket->close();