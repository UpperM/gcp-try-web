#
# This is an example VCL file for Varnish.
#
# It does not do anything by default, delegating control to the
# builtin VCL. The builtin VCL is called when there is no explicit
# return statement.
#
# See the VCL chapters in the Users Guide for a comprehensive documentation
# at https://www.varnish-cache.org/docs/.

# Marker to tell the VCL compiler that this VCL has been written with the
# 4.0 or 4.1 syntax.
vcl 4.1;
import directors;    # load the directors
# Default backend definition. Set this to point to your content server.
backend nginxa {.host = "nginx-a";}
backend nginxb {.host = "nginx-b";}
backend nginxc {.host = "nginx-c";}

sub vcl_init {
    new bar = directors.round_robin();
    bar.add_backend(nginxa);
    bar.add_backend(nginxb);
    bar.add_backend(nginxc);
}

sub vcl_recv {
    # send all traffic to the bar director:
    set req.backend_hint = bar.backend();
}
