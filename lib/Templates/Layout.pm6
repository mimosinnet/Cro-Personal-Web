unit class Templates::Layout;
use Template::Mojo;

has Str $.template;
has Str $.layout is default('default');

method html {
  $*OUT.print: Template::Mojo.from-file("views/layouts/$!layout.html");
  return Template::Mojo.from-file("views/layouts/$!layout.html").render({ 
    content => Template::Mojo.from-file("views/$!template").render
  });
}
