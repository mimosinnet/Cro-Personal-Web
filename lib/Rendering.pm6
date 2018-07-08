unit module Rendering;
use Template::Mojo;
use Rendering::Menu :menu;

sub html( Str :$template, Str :$layout = 'default' ) is export(:html) {
  my $lay  = Template::Mojo.from-file("views/layouts/$layout.html.ep"); 
  my $tmpl = Template::Mojo.from-file("pages/$template").render;
  my $menu = menu( :$template );
  return $lay.render({ 
    content => $tmpl,
    menu    => $menu,
  });
}
