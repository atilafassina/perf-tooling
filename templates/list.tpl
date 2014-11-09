<!DOCTYPE html>
<html lang="en">
  <%=
    partial(
      'templates/partials/head.tpl',
      {
        css  : css,
        site : site,
        svg  : svg
      }
    )
  %>

  <body>

      <%=
        partial(
          'templates/partials/header.tpl',
          {
            active : type,
            cdn    : cdn,
            site   : site
          }
        )
      %>

      <main class="container">

        <%=
          partial(
            'templates/partials/fuzzy.tpl',
            {
              list : list,
              type : type
            }
          )
        %>

        <%=
          partial(
            'templates/partials/lists/' + type + '.tpl',
            {
              list : list
            }
          )
        %>

      </main>

      <%=
        partial(
          'templates/partials/footer.tpl',
          {}
        )
      %>

    <script>
      window.list = <%= JSON.stringify(
        _.map( list, function( entry ) {
          var fuzzy = '';
          var keys  = _.keys( entry );

          keys.forEach( function( key ) {
            if ( key !== 'stars' ) {
              if ( key !== 'description' ) {
                fuzzy += key;
              }

              fuzzy += entry[ key ];
            }
          } );

          return {
            fuzzy : fuzzy,
            name  : entry.name.replace( ' ', '-' )
          }
        } )
      )
      %>;
    </script>
    <script src="<%= cdn %>/tooling.js?<%= hash.js %>" async></script>
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-53831300-1', 'auto');
      ga('send', 'pageview');
    </script>

  </body>

</html>

