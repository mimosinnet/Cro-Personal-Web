unit module Rendering::Menu;

sub menu( Str :$template ) is export(:menu) {

  my @dirs;
  for "pages/$template".IO.dirname.IO.dir -> $dir {
    @dirs.push: $dir if $dir.d;
  }

  my $menu = q:to/END/;
    <table>
      <tr>
        <td style='background-color:LightGreen'><a href='/'>Inici</a></td>
    END
  my $anterior      = $template.IO.dirname.IO.dirname;
  my $anterior_nom  = $anterior.IO.basename;
  $menu ~= "    <td style='background-color:GreenYellow'><a href='/$anterior/index.html.ep'>{$anterior_nom}</a></td>\n" unless $anterior eq '.';

  for @dirs -> $dir {
    $dir ~~ /pages\/(.*)/;
    $menu ~= "    <td><a href='/{$0}/index.html.ep'>{$dir.basename}</a></td>\n";
  }

  $menu ~= q:to/END/;
      </tr>
    </table>
    END

 return $menu;
}
