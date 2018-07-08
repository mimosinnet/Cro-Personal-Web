use Cro::HTTP::Log::File;
use Cro::HTTP::Server;
use Routes;

constant HOST = 'localhost';
constant PORT = 3000;

my Cro::Service $http = Cro::HTTP::Server.new(
    :http<1.1>, 
    host => HOST, 
    port => PORT, 
    application => routes(),
    after => [
      Cro::HTTP::Log::File.new(logs => $*OUT, errors => $*ERR)
    ]
);
$http.start;
say "Listening at http://{HOST}:{PORT}";
react {
    whenever signal(SIGINT) {
        say "Shutting down...";
        $http.stop;
        done;
    }
}
