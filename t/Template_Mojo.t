use Template::Mojo;

my $template = 'views/Recerca/index.html';
my $layout   = 'views/layouts/default.html';

say Template::Mojo.new($layout.IO.slurp).render({  content => Template::Mojo.new($template.IO.slurp).render });
