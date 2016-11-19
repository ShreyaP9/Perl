use IO::Socket::INET;

 
# auto-flush on socket
$| = 1;
 
# create a connecting socket
my $socket = new IO::Socket::INET (
    PeerAddr => '10.2.13.216',				#server's ip address
    PeerPort => '8014',					#change the port
    Proto => 'tcp',
);

die "cannot connect to the server $!\n" unless $socket;
print "connected to the server\n";
 

# data to send to a server
$line = <STDIN>;
if ($line eq "\n") 
{
  print "Nothing entered!\n";
} 
else 
{
  print "Data entered is: $line";
}

#my $req = 'hello';
#my $size = $socket->send($req);
#print "sent data of length $size\n";
 

# notify server that request has been sent
shutdown($socket, 1);
 

# receive a response of up to 1024 characters from server
my $response = "";
$socket->recv($response, 1024);
print "received response: $response\n";
 
$socket->close();