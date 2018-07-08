use lib 'lib';
use Rendering::Menu :menu;

say menu( template => 'Docència/2018-19/index.html.ep' );
say '-' x 20;
say menu( template => 'Docència/index.html.ep' );
say '-' x 20;
say menu( template => 'index.html.ep' );
