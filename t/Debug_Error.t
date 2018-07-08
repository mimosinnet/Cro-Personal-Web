use lib 'lib';
use Rendering;

my $template = 'Recerca/index.html';

my $render = Rendering.new( :$template ).html;

say $render;

