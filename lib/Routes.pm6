use Cro::HTTP::Router;
use Rendering :html;

sub routes() is export {
  route {
    get ->        { content 'text/html', html( template => 'Inici.html.ep') }
    get -> 'css', *@path { static 'views/css', @path }
    get -> *@path { 
      my $file = @path.join('/');
      content 'text/html', html( template => $file)
    }
  }
}
