my $template = 'views/Recerca/index.html';
my $layout   = 'views/layouts/default.html';

say IO::Handle.new( :path( $template.IO ) ).encoding;
say IO::Handle.new( :path( $layout.IO)    ).encoding;

my $tmpl = slurp "$template".IO, enc => 'utf8';
say $tmpl;
